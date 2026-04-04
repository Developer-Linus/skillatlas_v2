cl import "./styles/global.css";

cl {
    import from "@jac/runtime" { Router, Routes, Route }
    import from "./pages/index" { page as IndexPage }
    import from "./pages/not_found" { page as NotFoundPage }

    def:pub app -> JsxElement {
        return
            <Router>
                <Routes>
                    <Route path="/" element={<IndexPage/>}/>
                    <Route path="*" element={<NotFoundPage/>}/>
                </Routes>
            </Router>;
    }
}
