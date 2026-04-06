import from "@jac/runtime" { jacSignup, useNavigate }

def:pub SignupPage -> JsxElement {
    has name: str = "",
        email: str = "",
        password: str = "",
        confirmPassword: str = "",
        error: str = "",
        loading: bool = False;

    navigate: any = useNavigate();

    async def handleSignup(e: any) -> None {
        e.preventDefault();
        if password != confirmPassword {
            error = "Passwords do not match";
            return;
        }
        loading = True;
        error = "";
        result: dict = await jacSignup(email, password);
        if result["success"] {
            navigate("/dashboard");
        } else {
            error = result["error"] or "Signup failed";
            loading = False;
        }
    }

    return
        <div
            className="min-h-screen bg-[#0f2027] flex flex-col items-center justify-center px-4"
        >
            <div className="w-full max-w-md">
                <div
                    className="bg-white/5 border border-white/10 rounded-2xl p-8 shadow-2xl"
                >
                    <div className="mb-7">
                        <h1 className="font-display text-2xl font-bold text-white">
                            Get Started for Free
                        </h1>
                        <p className="text-white/50 text-sm mt-1">
                            Create your account and start your learning journey.
                        </p>
                    </div>
                    <form
                        className="space-y-4"
                        onSubmit={lambda e: any  -> None { handleSignup(e);}}
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
                                required={True}
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
                                required={True}
                            />
                        </div>
                        <div className="space-y-1.5">
                            <label
                                className="text-sm font-medium text-white/80"
                                htmlFor="signup-confirm-password"
                            >
                                Confirm Password
                            </label>
                            <input
                                id="signup-confirm-password"
                                type="password"
                                placeholder="Repeat your password"
                                value={confirmPassword}
                                onChange={lambda e: any  -> None { confirmPassword = e.target.value;}}
                                className="w-full px-4 py-2.5 rounded-lg bg-white/5 border border-white/10 text-white placeholder:text-white/30 focus:outline-none focus:border-[#2dd4bf] transition-colors text-sm"
                                required={True}
                            />
                        </div>
                        {error
                        and <p
                            className="text-sm text-red-400 bg-red-400/10 border border-red-400/20 rounded-lg px-4 py-2.5"
                        >
                            {error}
                        </p>}
                        <button
                            type="submit"
                            disabled={loading}
                            className="w-full py-3 mt-2 rounded-lg bg-[#2dd4bf] text-[#0f2027] font-bold text-sm hover:bg-[#2dd4bf]/90 transition-colors disabled:opacity-60 disabled:cursor-not-allowed"
                        >
                            {"Creating account…" if loading else "Sign Up"}
                        </button>
                    </form>
                    <p className="text-center text-white/40 text-sm mt-6">
                        Already have an account?
                        <a
                            href="/login"
                            className="text-[#2dd4bf] hover:underline ml-1 font-medium"
                        >
                            Sign in
                        </a>
                    </p>
                </div>
            </div>
        </div>;
}
