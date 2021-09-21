from flask import render_template
from flask import Blueprint
import json
import logging

bp = Blueprint("site", __name__)
timeout = 5


logging.basicConfig(
    filename = 'app.log',
    level = logging.DEBUG,
    format = '%(asctime)s - %(name)s - %(levelname)s - %(message)s',
    datefmt = '%m/%d/%Y %I:%M:%S %p'
    )

@bp.route("/")
def index():
    if timeout >= 6:
        return render_template("error.html")
    else:
        return render_template(
            "index.html",
        )


@bp.route("/about")
def about():
    return render_template(
        "sobre.html",
    )
