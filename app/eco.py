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

    db = get_db()
    benefits = db.execute(
        "SELECT * FROM benefit"
    ).fetchall()

    return render_template("shop.html", benefits=benefits)

@bp.route("/profile", methods=["GET"])
@login_required
def profile():

    db = get_db()

    return render_template("profile.html")

@bp.route("/scan", methods=["GET"])
@login_required
def scan():

    db = get_db()

    return render_template("scan.html")

@bp.route("/scan2", methods=["GET"])
@login_required
def scan2():

    db = get_db()

    materials=["plastic", "metal", "paper", "glass"]

    return render_template("scan2.html", materials=materials)

@bp.route("/add_material", methods=["GET"])
@login_required
def material():
    args = request.args
    material = args["material"]
    quantity = args["quantity"]
    db = get_db()

    new_value = g.user[material] + float(quantity)

    query = "UPDATE user SET {} = {} WHERE id = {}".format(material, new_value, g.user["id"])
    db.execute(
        query
    )
    db.commit()

    return {
        "status": "ok"
    }

@bp.route("/redeem_benefit", methods=["GET"])
@login_required
def redeem():
    args = request.args
    benefit_no = args["benefit"]
    db = get_db()

    column_name = "benefit" + benefit_no
    query = "UPDATE user SET {} = 1 WHERE id = {}".format(column_name, g.user["id"])
    print("Executing:", "UPDATE user SET {} = 1 WHERE id = {}".format(column_name, g.user["id"]))
    db.execute(
        query
    )
    db.commit()

    benefit = db.execute(
        "SELECT * FROM benefit WHERE id = ?", (benefit_no,)
    ).fetchone()

    query = "UPDATE user SET coins = {} WHERE id = {}".format( g.user["coins"]-benefit["price"] , g.user["id"])
    print("Executing:", "UPDATE user SET {} = 1 WHERE id = {}".format(column_name, g.user["id"]))
    db.execute(
        query
    )
    db.commit()

    return {
        "status": "ok"
    }

    