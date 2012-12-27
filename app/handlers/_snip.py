class APIHTTPError(tornado.web.HTTPError):
    def __init__(self, status_code, log_message=None, *args, **kwargs):
        super(APIHTTPError, self).__init__(status_code, log_message=None, *args, **kwargs)

    def __str__(self):

        err = {
            'code' : self.status_code,
            'reason' : self.reason or httplib.responses.get(self.status_code, 'Unknown')
        }

        if self.log_message:
            err.update({
                'log' : self.log_message % self.args
            })

        return tornado.escape.json_encode(err)


