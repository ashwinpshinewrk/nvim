return {
    'akinsho/flutter-tools.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
        'mfussenegger/nvim-dap',
    },
    keys = {

        {"<leader>fr", "<cmd>FlutterRun<cr>", desc="Flutter Run"},
        {"<leader>fd", "<cmd>FlutterDevices<cr>", desc="Flutter Devices"},
        {"<leader>fh", "<cmd>FlutterReload<cr>", desc="Flutter Reload"},
        {"<leader>fH", "<cmd>FlutterRestart<cr>", desc="Flutter Restart"},
        {"<leader>fq", "<cmd>FlutterQuit<cr>", desc="Flutter Quit"}
    },
    config = function ()
        local flutter_binary_path = vim.fn.expand("~/.comp/flutter/bin/flutter")
      require("flutter-tools").setup ({
            ui = {
                border = "rounded",
                notification_style = "plugin",
            },
            decorations = {
                statusline = {
                    app_version = true,
                    device = true,
                }
            },
            dev_log = {
                enabled = true,
                open_cmd = "tabedit",
            },
            lsp = {
                color = {
                    enabled = true,
                    background = false,
                    background_color = nil,
                    foreground = false,
                    virtual_text = true,
                    virtual_text_str = "■",
                },
                settings = {
                    showTodos =true,
                    completeFunctionCalls = true,
                    renameFilesWithClasses = "prompt",
                    enableSnippets = true,
                    updateImportsOnRename = true,
                }
            },
            debugger = {
                enabled = true,
                run_via_dap = true,
                register_configurations = function (paths)
                    local dap = require("dap")
                    dap.adapters.dart = {
                        type = "executable",
                        command = paths.flutter_bin,
                        args = {"debug-adapter"},
                    }
                    dap.configurations.dart = {
                        {
                            type = "dart",
                            request = "launch",
                            name = "Launch flutter",
                            dartSdkPath = paths.dart_sdk,
                            flutterSdkPath = paths.flutter_sdk,
                            program = "${workspaceFolder}/lib/main.dart",
                            cwd = "${workspaceFolder}"
                        }
                    }
                end
            },
            flutter_path = flutter_binary_path,
        })
    end,
    ft = "dart"
}
-- NOTE THAT DON'T INSTALL DARTLS , if this config is installed
