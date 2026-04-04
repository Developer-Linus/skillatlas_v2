cl import from "@jac/runtime" { Link, useLocation }

def:pub NavLink(
    `to: str, className: str = "", activeClassName: str = "", children: any = None
) -> JsxElement {
    location: any = useLocation();
    isActive: bool = location.pathname == `to;
    finalClass: str = f"{className} {activeClassName}"
        if (isActive and activeClassName != "")
        else className;

    return
        <Link to={`to} className={finalClass}>
            {children}
        </Link>;
}
