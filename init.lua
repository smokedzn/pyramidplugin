local function send_pyramid(ctx, emote)
    local pyramid = {1, 2, 3, 2, 1}
    local delay = 1  -- Start with no delay
    local delay_increment = 800  -- 800 milliseconds between each message (in milliseconds)

    for _, count in ipairs(pyramid) do
        local message = string.rep(emote .. " ", count):sub(1, -2)

        -- Schedule each message with incremental delay
        c2.later(function()
            ctx.channel:send_message(message)
        end, delay)

        -- Increment the delay for the next message
        delay = delay + delay_increment
    end
end


-- Command: /pyramid <emote>
local function cmd_pyramid(ctx)
    local emote = ctx.words and ctx.words[2] or nil

    if not emote or emote == "" then
        -- Default Emote is Kappa
		emote = "Kappa"
    end

    ctx.channel:add_system_message("Building pyramid with emote: " .. emote)
    send_pyramid(ctx, emote)
end
c2.register_command("/pyramid", cmd_pyramid)
