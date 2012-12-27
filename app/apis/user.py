# -*- coding: utf-8 -*-

import tornado.escape

from apis import BaseModel

class UserModel(BaseModel):
    def __init__(self):
        pass
    def get_profile(self, **kwargs):
        uid = kwargs.get('uid', None)
        user = kwargs.get('user', None)

        if uid is not None:
            ret = self.db.get('SELECT id,tag,nick,cjknick,email,gravatar,date FROM users WHERE id = %s', uid)
        elif user is not None:
            ret = self.db.get('SELECT id,tag,nick,cjknick,email,gravatar,date FROM users WHERE nick = %s', user)
        else:
            ret = {}
        
        if ret.has_key('date'):
            ret.update({
                'date' : str(ret['date'])
            })

        print tornado.escape.native_str(ret['cjknick'])

        #if ret.has_key('cjknick'):
            #ret.update({
                #'cjknick' : tornado.escape.native_str(ret['cjknick'])
            #})

        return ret

