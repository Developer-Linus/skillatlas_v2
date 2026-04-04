cl import "./styles/global.css";


cl {
    def:pub app -> JsxElement {
        return
            <div
                className="min-h-screen flex items-center justify-center bg-[#0f172a] px-6"
            >
                <div
                    className="bg-[#111827] shadow-2xl rounded-2xl p-8 max-w-xl w-full border border-gray-800 text-center"
                >
                    <h1 className="text-3xl md:text-4xl font-bold text-indigo-400 mb-4">
                        Welcome to SkillAtlas 🚀
                    </h1>
                    <p className="text-gray-400 text-base md:text-lg leading-relaxed">
                        Discover your path in tech. SkillAtlas helps you understand your strengths, identify skill gaps, and guides you toward the career you truly want.
                    </p>
                    <button
                        className="mt-6 px-6 py-3 bg-indigo-500 hover:bg-indigo-600 transition rounded-xl text-white font-medium shadow-lg"
                    >
                        Get Started
                    </button>
                </div>
            </div>;
    }
}
