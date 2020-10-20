def _odoo_execute_kw(secrets):
    import xmlrpc.client as _client
    if not all([params.URL, params.DB, secrets.USERNAME, secrets.PASSWORD]):
        raise UserError("External Odoo Credentials are not set")

    def f(model, method, *args, **kwargs):
        args["image"] = False
        log("args: %s" % type(args))

        log_transmission("XMLRPC DB=%s URL=%s" % (params.DB, params.URL),
                         json.dumps([method, args, kwargs]))
        log("6")
        try:
            log("7")
            common = _client.ServerProxy(
                '{}/xmlrpc/2/common'.format(params.URL))
            log("8")
            uid = common.authenticate(params.DB, secrets.USERNAME,
                                      secrets.PASSWORD, {})
            log("9")
            models = _client.ServerProxy(
                '{}/xmlrpc/2/object'.format(params.URL))
            log("10")
        except OSError:
            raise RetryableJobError("Error on connecting to external Odoo")
        log("11")
        res = models.execute_kw(params.DB, uid, secrets.PASSWORD, model, method,
                                args, kwargs)
        log("12")
        log("Response: %s" % res, level="debug")
        log("13")
        return res

    return f


odoo_execute_kw = _odoo_execute_kw(secrets)

from odoo.tools import DEFAULT_SERVER_DATETIME_FORMAT