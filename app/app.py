from flask import Flask
from app.ext import config, site, toolbar
import logging


def create_app():
    app = Flask(__name__)
    config.init_app(app)
    # admin.init_app(app)
    toolbar.init_app(app)
    site.init_app(app)
    return app
