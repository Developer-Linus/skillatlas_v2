import from "@jac/runtime" { jacLogin, useNavigate }

def:pub LoginPage -> JsxElement {
    has username: str = "",
        password: str = "",
        error: str = "",
        loading: bool = False;

    navigate: any = useNavigate();

    async def handleLogin(e: any) -> None {
        e.preventDefault();
        loading = True;
        error = "";
        success: bool = await jacLogin(username, password);
        if success {
            navigate("/dashboard");
        } else {
            error = "Invalid credentials. Please try again.";
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
                            Welcome back
                        </h1>
                        <p className="text-white/50 text-sm mt-1">
                            Sign in to continue your learning journey.
                        </p>
                    </div>
                    <form
                        className="space-y-4"
                        onSubmit={lambda e: any  -> None { handleLogin(e);}}
                    >
                        <div className="space-y-1.5">
                            <label
                                className="text-sm font-medium text-white/80"
                                htmlFor="login-username"
                            >
                                Email
                            </label>
                            <input
                                id="login-username"
                                type="email"
                                placeholder="you@example.com"
                                value={username}
                                onChange={lambda e: any  -> None { username = e.target.value;}}
                                className="w-full px-4 py-2.5 rounded-lg bg-white/5 border border-white/10 text-white placeholder:text-white/30 focus:outline-none focus:border-[#2dd4bf] transition-colors text-sm"
                                required={True}
                            />
                        </div>
                        <div className="space-y-1.5">
                            <label
                                className="text-sm font-medium text-white/80"
                                htmlFor="login-password"
                            >
                                Password
                            </label>
                            <input
                                id="login-password"
                                type="password"
                                placeholder="Enter your password"
                                value={password}
                                onChange={lambda e: any  -> None { password = e.target.value;}}
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
                            {"Signing in…" if loading else "Sign In"}
                        </button>
                    </form>
                    <p className="text-center text-white/40 text-sm mt-6">
                        Don't have an account?
                        <a
                            href="/signup"
                            className="text-[#2dd4bf] hover:underline ml-1 font-medium"
                        >
                            Get started for free
                        </a>
                    </p>
                </div>
            </div>
        </div>;
}
