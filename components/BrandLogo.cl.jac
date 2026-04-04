def:pub BrandLogo(className: str = "") -> JsxElement {
    return
        <a href="/" className={f"inline-flex items-center gap-4 {className}"}>
            <img
                src="/assets/images/skillatlas-compass-logo.svg"
                alt="SkillAtlas icon"
                className="h-10 w-10 md:h-16 md:w-16 object-contain"
            />
            <span
                className="inline-flex items-baseline text-[1.75rem] font-bold"
                style={{"letterSpacing": "-0.01em"}}
            >
                <span
                    className="inline-flex items-center justify-center w-11 h-11 rounded-full border-2 border-[#00E5FF] text-[#00E5FF] text-[2.5rem] leading-none"
                >
                    S
                </span>
                <span className="text-white">
                    kill
                </span>
                <span
                    className="inline-flex items-center justify-center w-11 h-11 rounded-full border-2 border-[#00E5FF] text-[#00E5FF] text-[2.5rem] leading-none ml-[0.04em]"
                >
                    A
                </span>
                <span className="text-white">
                    tlas
                </span>
            </span>
        </a>;
}
