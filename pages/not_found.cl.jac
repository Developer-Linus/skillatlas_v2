import from "@jac/runtime" { useLocation }
import from "../components/BrandLogo" { BrandLogo }

def:pub page -> JsxElement {
    location: any = useLocation();

    can with entry {
        console.error(
            f"404 Error: User attempted to access non-existent route: {location.pathname}"
        );
    }

    return
        <div
            className="flex min-h-screen flex-col items-center justify-center bg-[#0f2027] px-6"
        >
            <BrandLogo className="mb-12 opacity-60"/>
            <div className="text-center">
                <p
                    className="font-display text-[8rem] font-bold leading-none text-white/10 select-none"
                >
                    404
                </p>
                <h1
                    className="font-display text-2xl md:text-3xl font-bold text-white mt-2 mb-3"
                >
                    Page not found
                </h1>
                <p className="text-white/50 text-sm mb-8 max-w-xs mx-auto">
                    The page you're looking for doesn't exist or has been moved.
                </p>
                <a
                    href="/"
                    className="inline-flex items-center gap-2 px-6 py-3 rounded-xl bg-[#2dd4bf] text-[#0f2027] font-bold text-sm hover:bg-[#2dd4bf]/90 transition-colors"
                >
                    Back to Home
                </a>
            </div>
        </div>;
}
