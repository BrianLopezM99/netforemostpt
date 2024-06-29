System.register("index", ["express"], function (exports_1, context_1) {
    "use strict";
    var express_1, app, PORT;
    var __moduleName = context_1 && context_1.id;
    return {
        setters: [
            function (express_1_1) {
                express_1 = express_1_1;
            }
        ],
        execute: function () {
            app = express_1.default();
            app.use(express_1.default.json());
            PORT = 3000;
            app.get('/ping', (_req, res) => {
                res.send('someone pinged here');
                res.send('pong');
            });
            app.listen(PORT, () => {
                console.log(`server running on port ${PORT}`);
            });
        }
    };
});
