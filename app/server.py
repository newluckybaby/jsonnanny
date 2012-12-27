# -*- coding: utf-8 -*-

import os

import tornado.ioloop
import tornado.web
import torndb

import config
import urls
import apis

class Application(tornado.web.Application):
    def __init__(self):
        settings = {
            'template_path': os.path.join(os.path.dirname(__file__), '../template'),
            'static_path': os.path.join(os.path.dirname(__file__), '../static'),
            'xsrf_cookies' : False, 
            'cookie_secret' : '3295bfab668c4ad48dad43f890402905',
            'debug': True,
        }

        self.db = torndb.Connection(config.DB_HOST,config.DB_DATABASE,config.DB_USER)
        apis.BaseModel.setup_dbs({'db' : self.db})
        
        super(Application,self).__init__(urls.urls, **settings)

if __name__ == '__main__':
    Application().listen(8080)
    tornado.ioloop.IOLoop.instance().start()
