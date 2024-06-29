var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
define("index", ["require", "exports", "express"], function (require, exports, express_1) {
    "use strict";
    Object.defineProperty(exports, "__esModule", { value: true });
    express_1 = __importDefault(express_1);
    const app = (0, express_1.default)();
    app.use(express_1.default.json());
    const PORT = 3000;
    app.get('/ping', (_req, res) => {
        res.send('someone pinged here');
        res.send('pong');
    });
    app.listen(PORT, () => {
        console.log(`server running on port ${PORT}`);
    });
});
