import functools

from flask import Blueprint
from flask import flash
from flask import g
from flask import redirect
from flask import render_template
from flask import request
from flask import session
from flask import url_for
from werkzeug.security import check_password_hash
from werkzeug.security import generate_password_hash

from .db import get_db
from .auth import login_required

bp = Blueprint("eco", __name__, url_prefix="/eco")

@bp.route("/", methods=["GET"])
def index():

    if g.user:
        return render_template("logged_in_index.html")

    return render_template("index.html")


@bp.route("/shop", methods=["GET"])
@login_required
def shop():
    return render_template("shop.html")

    