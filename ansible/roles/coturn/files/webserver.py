#!/usr/bin/python

import re
import web
import json
import subprocess
import os

class Status:
    def GET(self, args=None):
        coturnStatus=0
        readyToDelete=True
        status=os.system("systemctl is-active --quiet coturn")
        if status==0 :
            coturnStatus=1
            readyToDelete=False
        return json.dumps({"coturnStatus":coturnStatus,"readyToDelete":readyToDelete})

urls = ("/status", "Status")
app = web.application(urls, globals())

if __name__ == "__main__":
    app.run()
