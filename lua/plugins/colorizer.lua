return {
 'norcalli/nvim-colorizer.lua',
    config = function ()
        require'colorizer'.setup({
            "html",
            "css",
            "markdown",
            "svelte",
        },{
                RBG = true;
                RRGGBB = true;
                RRGGBBAA = true;
                AARRGGBB = true;
                mode = "background";
            }
        )
    end
}
