import from "lucide-react" { X }

def:pub SignUpModal(open: bool = False, onOpenChange: any = None) -> JsxElement {
    has name: str = "",
        email: str = "",
        password: str = "";

    def close -> None {
        if onOpenChange {
            onOpenChange(False);
        }
    }

    def handleSubmit(e: any) -> None {
        e.preventDefault();
        close();
    }

    if not open {
        return
            <></>;
    }

    return
        <div
            className="fixed inset-0 z-50 flex items-center justify-center"
            onClick={lambda -> None { close();}}
        >
            <div className="absolute inset-0 bg-black/60 backdrop-blur-sm"/>
            <div
                className="relative z-10 w-full max-w-md mx-4 bg-[#0f1f2e] border border-white/10 rounded-2xl p-8 shadow-2xl"
                onClick={lambda e: any  -> None { e.stopPropagation();}}
            >
                <div className="flex items-start justify-between mb-6">
                    <div>
                        <h2 className="font-display text-2xl font-bold text-white">
                            Get Started for Free
                        </h2>
                        <p className="text-white/50 text-sm mt-1">
                            Create your account and start your learning journey.
                        </p>
                    </div>
                    <button
                        className="text-white/40 hover:text-white transition-colors ml-4 mt-1"
                        onClick={lambda -> None { close();}}
                    >
                        <X size={20}/>
                    </button>
                </div>
                <form
                    className="space-y-4"
                    onSubmit={lambda e: any  -> None { handleSubmit(e);}}
                >
                    <div className="space-y-1.5">
                        <label
                            className="text-sm font-medium text-white/80"
                            htmlFor="signup-name"
                        >
                            Full Name
                        </label>
                        <input
                            id="signup-name"
                            type="text"
                            placeholder="Enter your name"
                            value={name}
                            onChange={lambda e: any  -> None { name = e.target.value;}}
                            className="w-full px-4 py-2.5 rounded-lg bg-white/5 border border-white/10 text-white placeholder:text-white/30 focus:outline-none focus:border-[#2dd4bf] transition-colors text-sm"
                        />
                    </div>
                    <div className="space-y-1.5">
                        <label
                            className="text-sm font-medium text-white/80"
                            htmlFor="signup-email"
                        >
                            Email
                        </label>
                        <input
                            id="signup-email"
                            type="email"
                            placeholder="you@example.com"
                            value={email}
                            onChange={lambda e: any  -> None { email = e.target.value;}}
                            className="w-full px-4 py-2.5 rounded-lg bg-white/5 border border-white/10 text-white placeholder:text-white/30 focus:outline-none focus:border-[#2dd4bf] transition-colors text-sm"
                        />
                    </div>
                    <div className="space-y-1.5">
                        <label
                            className="text-sm font-medium text-white/80"
                            htmlFor="signup-password"
                        >
                            Password
                        </label>
                        <input
                            id="signup-password"
                            type="password"
                            placeholder="Create a password"
                            value={password}
                            onChange={lambda e: any  -> None { password = e.target.value;}}
                            className="w-full px-4 py-2.5 rounded-lg bg-white/5 border border-white/10 text-white placeholder:text-white/30 focus:outline-none focus:border-[#2dd4bf] transition-colors text-sm"
                        />
                    </div>
                    <button
                        type="submit"
                        className="w-full py-3 mt-2 rounded-lg bg-[#2dd4bf] text-[#0f2027] font-bold text-sm hover:bg-[#2dd4bf]/90 transition-colors"
                    >
                        Sign Up
                    </button>
                </form>
            </div>
        </div>;
}
