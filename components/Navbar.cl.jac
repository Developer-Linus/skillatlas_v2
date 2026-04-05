import from "./BrandLogo" { BrandLogo }
import from "lucide-react" { Menu, X }
import from "@jac/runtime" { jacIsLoggedIn, jacLogout, useNavigate }

glob NAV_ITEMS: list = [
         {"label": "Features", "href": "#features"},
         {"label": "How It Works", "href": "#how-it-works"},
         {"label": "Pricing", "href": "#pricing"},
         {"label": "Success Stories", "href": "#success-stories"},
         {"label": "About Us", "href": "#our-team"},

     ];

def:pub Navbar(onGetStarted: any = None) -> JsxElement {
    has open: bool = False;

    isLoggedIn: bool = jacIsLoggedIn();
    navigate: any = useNavigate();

    def handleGetStarted -> None {
        if onGetStarted {
            onGetStarted();
        }
    }

    def handleMobileGetStarted -> None {
        open = False;
        if onGetStarted {
            onGetStarted();
        }
    }

    def handleLogout -> None {
        jacLogout();
        navigate("/");
    }

    def handleMobileLogout -> None {
        open = False;
        jacLogout();
        navigate("/");
    }

    return
        <nav
            className="fixed top-0 left-0 right-0 z-50 bg-[#0f2027] backdrop-blur-md border-b border-white/10"
        >
            <div
                className="container mx-auto flex items-center justify-between px-6 py-4"
            >
                <div className="mr-8">
                    <BrandLogo/>
                </div>
                <div className="hidden md:flex items-center gap-8">
                    {[
                        <a
                            key={item["label"]}
                            href={item["href"]}
                            className="text-[14px] font-bold text-white/65 hover:text-white transition-colors"
                        >
                            {item["label"]}
                        </a> for item in NAV_ITEMS
                    ]}{isLoggedIn
                    and (
                        <div className="flex items-center gap-3">
                            <a
                                href="/dashboard"
                                className="text-[14px] font-bold text-white/65 hover:text-white transition-colors"
                            >
                                Dashboard
                            </a>
                            <button
                                className="border border-white/20 text-white/65 hover:text-white hover:border-white/40 font-semibold text-sm px-4 py-2 rounded-md transition-colors"
                                onClick={lambda -> None { handleLogout();}}
                            >
                                Logout
                            </button>
                        </div>
                    )
                    or (
                        <div className="flex items-center gap-3">
                            <a
                                href="/login"
                                className="border border-white/30 text-white hover:border-white/60 font-semibold text-sm px-4 py-2 rounded-md transition-colors"
                            >
                                Login
                            </a>
                            <button
                                className="bg-[#fbbf24] text-[#0f2027] hover:bg-[#fbbf24]/90 font-semibold text-sm px-4 py-2 rounded-md"
                                onClick={lambda -> None { handleGetStarted();}}
                            >
                                Get Started
                            </button>
                        </div>
                    )}
                </div>
                <button
                    className="md:hidden text-white"
                    onClick={lambda -> None { open = not open;}}
                >
                    {(<X size={28} strokeWidth={3}/>)
                        if open
                        else (<Menu size={28} strokeWidth={3}/>)}
                </button>
            </div>
            {open
            and <div className="md:hidden bg-[#0f2027] px-6 pb-6 flex flex-col gap-4">
                {[
                    <a
                        key={item["label"]}
                        href={item["href"]}
                        className="text-sm font-medium text-white/65 hover:text-white"
                        onClick={lambda -> None { open = False;}}
                    >
                        {item["label"]}
                    </a> for item in NAV_ITEMS
                ]}{isLoggedIn
                and (
                    <>
                        <a
                            href="/dashboard"
                            className="text-sm font-medium text-white/65 hover:text-white"
                            onClick={lambda -> None { open = False;}}
                        >
                            Dashboard
                        </a>
                        <button
                            className="w-full border border-white/20 text-white/65 hover:text-white hover:border-white/40 font-semibold text-sm px-4 py-2 rounded-md transition-colors"
                            onClick={lambda -> None { handleMobileLogout();}}
                        >
                            Logout
                        </button>
                    </>
                )
                or (
                    <>
                        <a
                            href="/login"
                            className="text-sm font-medium text-white/65 hover:text-white"
                            onClick={lambda -> None { open = False;}}
                        >
                            Login
                        </a>
                        <button
                            className="w-full bg-[#fbbf24] text-[#0f2027] hover:bg-[#fbbf24]/90 font-semibold text-sm px-4 py-2 rounded-md"
                            onClick={lambda -> None { handleMobileGetStarted();}}
                        >
                            Get Started
                        </button>
                    </>
                )}
            </div>}
        </nav>;
}
