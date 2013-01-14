# -*- coding: utf-8 -*-

import httplib
import traceback
#import logging

import tornado.escape
from tornado.web import RequestHandler, HTTPError

from apis.authorize import AuthorizeModel
from apis.user import UserModel

class APIHandler(RequestHandler):
    def authorize(self):
        api_key = self.get_argument('apikey', None)
        user = self.get_argument('user', None)
        password = self.get_argument('password', None)

        is_invalid = AuthorizeModel().auth_user_api(api_key = api_key) if api_key is not None else \
                    AuthorizeModel().auth_user_pwd(user = user, password = password)
        if is_invalid:
            raise HTTPError(401)

    def write_error(self, status_code, **kwargs):
        err = {
            'meta' : {
                'code' : status_code,
                'message' : httplib.responses.get(status_code,'Unknown'),
            },
            'response' : None
        }
        if self.settings.get("debug") and "exc_info" in kwargs:
            err['meta'].update({
                'debug' : ''.join([line for line in traceback.format_exception(*kwargs["exc_info"])])
            })

        self.finish(err)

    def get_payload(self):
        try:
            ret = tornado.escape.json_decode(self.request.body)
        except:
            ret = {}

        return ret 

class UserHandler(APIHandler):
    def get(self, username = None):
        super(UserHandler, self).authorize()
        response = UserModel().get_profile(username = username, api_key = self.get_argument('apikey', None))

        if response:
            self.write({
                'response' : response
            })
        else:
            raise HTTPError(404)

    def patch(self, username = None):
        super(UserHandler, self).authorize()
        response = UserModel().patch_profile(payload = self.get_payload(), username = username, api_key = self.get_argument('apikey', None))

        if response:
            self.write({
                'response' : response
            })
        else:
            raise HTTPError(404)

class SchemaHandler(APIHandler):
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
