# -*- coding: utf-8 -*-

from apis import BaseModel

class AuthorizeModel(BaseModel):
    def __init__(self):
        pass

    def auth_user_api(self, **kwargs):
        return False

    def auth_user_pwd(self, **kwargs):
        return False
