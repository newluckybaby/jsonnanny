# -*- coding: utf-8 -*-

class BaseModel(object):
    _dbs = {}

    @classmethod
    def setup_dbs(cls, dbs):
        cls._dbs = dbs

    @property
    def dbs(self):
        return self.dbs

    @property
    def db(self):
        return self._dbs.get("db", None)
