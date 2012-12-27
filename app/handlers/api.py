# -*- coding: utf-8 -*-

import httplib
import logging
import traceback

from tornado.web import RequestHandler, HTTPError

from apis.authorize import AuthorizeModel
from apis.user import UserModel

class APIHandler(RequestHandler):
    def authorize(self):
        api_key = self.get_argument('apikey', None)
        user = self.get_argument('user', None)
        password = self.get_argument('password', None)

        if user is None or (api_key is None and password is None):
            raise HTTPError(401)
        else:
            is_invalid = AuthorizeModel().auth_user_api(user = user, api_key = api_key) if api_key is not None else \
                        AuthorizeModel().auth_user_pwd(user = user, password = password)
            if is_invalid:
                raise HTTPError(401)

    def write_error(self, status_code, **kwargs):
        err = {
            'code' : status_code,
            'message' : httplib.responses.get(status_code,'Unknown'),
        }
        if self.settings.get("debug") and "exc_info" in kwargs:
            err.update({
                'debug' : ''.join([line for line in traceback.format_exception(*kwargs["exc_info"])])
            })

        self.finish(err)

class UserHandler(APIHandler):
    def get(self, uid = None):
        super(UserHandler, self).authorize()
        response = UserModel().get_profile(uid = uid, user = self.get_argument('user', None))
        self.write(response)

class SchemaHandler(RequestHandler):
    def get(self):
        self.write('hello jsonnanny!')

class CaseHandler(RequestHandler):
    def get(self):
        self.write('hello jsonnanny!')

class AuthHandler(RequestHandler):
    def get(self):
        self.write('hello jsonnanny!')

class FeedHandler(RequestHandler):
    def get(self):
        self.write('hello jsonnanny!')

class SearchHandler(RequestHandler):
    def get(self):
        self.write('hello jsonnanny!')

class UtilityHandler(RequestHandler):
    def get(self):
        self.write('hello jsonnanny!')
