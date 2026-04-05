cl import "./styles/global.css";
cl import from "@jac/runtime" { Router, Routes, Route }
cl import from ".pages/index" { IndexPage }
cl import from ".pages/not_found" { NotFoundPage }
cl import from ".pages/dashboard" { DashboardPage }

cl {
    def:pub app -> JsxElement {
        return
            <Router>
                <Routes>
                    <Route path="/" element={<IndexPage/>}/>
                    <Route path="/dashboard" element={<DashboardPage/>}/>
                    <Route path="*" element={<NotFoundPage/>}/>
                </Routes>
            </Router>;
    }
}
