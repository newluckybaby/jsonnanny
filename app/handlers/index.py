# -*- coding: utf-8 -*-

import tornado.web

class MainHandler(tornado.web.RequestHandler):
    def get(self):
        self.write('hello jsonnanny!')
    def put(self):
        self.write('put it!')
    def delete(self):
        self.write('delete it!')
