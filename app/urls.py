# -*- coding: utf-8 -*-

import handlers.index as Index
import handlers.api as API

urls = [
    (r'/',Index.MainHandler),

    (r'/user.json',API.UserHandler),
    (r'/user.json/(.*)',API.UserHandler),
    (r'/schema.json',API.SchemaHandler),
    (r'/schema.json/(.*)',API.SchemaHandler),
    (r'/case.json',API.CaseHandler),
    (r'/case.json/(.*)',API.CaseHandler),
    (r'/feed.json',API.FeedHandler),
    (r'/schema.json/(.*)',API.FeedHandler),
    (r'/search.json',API.SearchHandler),
    (r'/search.json/(.*)',API.SearchHandler),
    (r'/utility.json/(.*)',API.UtilityHandler),
]
