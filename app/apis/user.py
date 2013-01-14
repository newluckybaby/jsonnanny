# -*- coding: utf-8 -*-

from apis import BaseModel

class UserModel(BaseModel):
    def get_profile(self, **kwargs):
        username = kwargs.get('username', None)
        api_key = kwargs.get('api_key', None)

        if username is not None:
            ret = self.db.get('SELECT id,tag,nick,cjknick,email,gravatar,date FROM users WHERE nick = %s', username)
        elif api_key is not None:
            ret = self.db.get('SELECT id,tag,nick,cjknick,email,gravatar,date FROM users WHERE apikey = %s', api_key)
        else:
            ret = None 
        
        if ret and ret.has_key('date'):
            ret.update({
                'date' : str(ret['date'])
            })

        return ret
    
    def patch_profile(self, **kwargs):
        username = kwargs.get('username', None)
        api_key = kwargs.get('api_key', None)
        white_list = ('gravatar')
        update_data = []

        if self.get_profile(**kwargs) is None:
            return None

        for k, v in kwargs.get('payload').iteritems():
            if k in white_list:
                update_data.append(k + '=\'' + v + '\'')

        if len(update_data) != 0:
            if username is not None:
                self.db.execute('UPDATE users SET ' + ','.join(update_data) + ' WHERE nick = %s', username)
            elif api_key is not None:
                self.db.execute('UPDATE users SET ' + ','.join(update_data) + ' WHERE apikey = %s', api_key)
            
        return self.get_profile(**kwargs)
