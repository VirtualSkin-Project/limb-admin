# Import flask dependencies
import subprocess
from flask import Blueprint, request, json, abort

# Import module models (i.e. Limb)
from app import app, constants as c

# Define the blueprint: 'limb', set its url prefix: app.url/limb
limb = Blueprint('limb', __name__)


@limb.route('/password', methods=c.EDIT)
def change_password():
    """
    Change brain password
    Use this route to change the ssh password on Virtual Limb
    ---
    tags:
        - limb
    responses:
        200:
            description: Return json with new limb
    """
    req = request.get_json(force=True)
    password = req['password'] if type(req['password']) is str else abort(c.CONFLICT, c.TYPE_ERROR.format('password'))
    print('echo -e "{}" | sudo passwd pi'.format(password + "\\n" + password))
    p = subprocess.call('bash change_password.sh "{}"'.format(password + "\\n" + password), shell=True)
    result = {"status": p}
    # result = {"status": 0}
    return app.response_class(response=json.dumps(result), status=c.OK, mimetype=c.JSON)
