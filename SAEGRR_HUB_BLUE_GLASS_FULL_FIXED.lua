repeat task.wait() until game:IsLoaded()

do
	local Players = game:GetService("Players")
	local LP2 = Players.LocalPlayer
	local TweenService2 = game:GetService("TweenService")
	local SoundService2 = game:GetService("SoundService")

	local splashGui = Instance.new("ScreenGui")
	splashGui.Name = "VeltrixSplash"
	splashGui.ResetOnSpawn = false
	splashGui.DisplayOrder = 999
	splashGui.IgnoreGuiInset = true
	if not pcall(function() splashGui.Parent = game:GetService("CoreGui") end) then
		splashGui.Parent = LP2:WaitForChild("PlayerGui")
	end

	local overlay = Instance.new("Frame", splashGui)
	overlay.Size = UDim2.new(1,0,1,0)
	overlay.BackgroundColor3 = Color3.fromRGB(0,0,0)
	overlay.BackgroundTransparency = 0
	overlay.BorderSizePixel = 0
	overlay.ZIndex = 1

	local tapHint = Instance.new("TextLabel", splashGui)
	tapHint.Size = UDim2.new(1, 0, 0, 20)
	tapHint.Position = UDim2.new(0, 0, 1, -36)
	tapHint.BackgroundTransparency = 1
	tapHint.Text = "CLICK TO SKIP"
	tapHint.TextColor3 = Color3.fromRGB(80, 110, 160)
	tapHint.Font = Enum.Font.Gotham
	tapHint.TextSize = 11
	tapHint.ZIndex = 10
	tapHint.TextXAlignment = Enum.TextXAlignment.Center

	local skipZone = Instance.new("TextButton", splashGui)
	skipZone.Size = UDim2.new(1,0,1,0)
	skipZone.BackgroundTransparency = 1
	skipZone.Text = ""
	skipZone.ZIndex = 9

	local container = Instance.new("Frame", splashGui)
	container.Size = UDim2.new(0,320,0,120)
	container.Position = UDim2.new(0.5,-160,0,-140)
	container.BackgroundTransparency = 1
	container.BorderSizePixel = 0
	container.ZIndex = 2
	container.ClipsDescendants = false

	local titleSplash = Instance.new("TextLabel", container)
	titleSplash.Size = UDim2.new(1,0,0,70)
	titleSplash.Position = UDim2.new(0,0,0,0)
	titleSplash.BackgroundTransparency = 1
	titleSplash.Text = "SAEGRR HUB"
	titleSplash.TextColor3 = Color3.fromRGB(255,255,255)
	titleSplash.Font = Enum.Font.GothamBlack
	titleSplash.TextSize = 48
	titleSplash.TextTransparency = 0
	titleSplash.ZIndex = 3
	do
		local g = Instance.new("UIGradient", titleSplash)
		g.Color = ColorSequence.new({
			ColorSequenceKeypoint.new(0, Color3.fromRGB(80,160,255)),
			ColorSequenceKeypoint.new(0.5, Color3.fromRGB(200,225,255)),
			ColorSequenceKeypoint.new(1, Color3.fromRGB(100,80,255))
		})
	end

	local introGlow = Instance.new("UIStroke", titleSplash)
	introGlow.Thickness = 3
	introGlow.Transparency = 0.25
	introGlow.Color = Color3.fromRGB(0, 255, 120)

	local introGlow2 = Instance.new("UIStroke", titleSplash)
	introGlow2.Thickness = 7
	introGlow2.Transparency = 0.82
	introGlow2.Color = Color3.fromRGB(0, 255, 100)

	task.spawn(function()
		while splashGui.Parent and not splashDone do
			introGlow.Transparency = 0.2 + math.abs(math.sin(tick() * 3)) * 0.35
			introGlow2.Transparency = 0.72 + math.abs(math.sin(tick() * 3)) * 0.18
			g.Rotation = (g.Rotation + 2.5) % 360
			RunService2.RenderStepped:Wait()
		end
	end)

	local subSplash = Instance.new("TextLabel", container)
	subSplash.Size = UDim2.new(1,0,0,24)
	subSplash.Position = UDim2.new(0,0,0,72)
	subSplash.BackgroundTransparency = 1
	subSplash.Text = "MAKE BY SAEGRR ❤️❤️❤️"
	subSplash.TextColor3 = Color3.fromRGB(80,220,130)
	subSplash.Font = Enum.Font.Gotham
	subSplash.TextSize = 13
	subSplash.TextTransparency = 0
	subSplash.ZIndex = 3

	local fragments = {}
	local fragTexts = {"CY","CLO","OO","O","HU","B"}
	local fragColors = {
		Color3.fromRGB(0,220,90),
		Color3.fromRGB(0,255,120),
		Color3.fromRGB(180,255,210),
		Color3.fromRGB(0,200,80),
		Color3.fromRGB(60,255,150),
		Color3.fromRGB(0,255,120),
	}
	for i, txt in ipairs(fragTexts) do
		local frag = Instance.new("TextLabel", splashGui)
		frag.Size = UDim2.new(0,90,0,60)
		frag.AnchorPoint = Vector2.new(0.5,0.5)
		frag.Position = UDim2.new(0.5, (i-3.5)*52, 0.5, -30)
		frag.BackgroundTransparency = 1
		frag.Text = txt
		frag.TextColor3 = fragColors[i]
		frag.Font = Enum.Font.GothamBlack
		frag.TextSize = 44
		frag.TextTransparency = 1
		frag.ZIndex = 5
		frag.Rotation = 0
		table.insert(fragments, frag)
	end

	local function playSound(id, pitch, vol, parent, delay)
		task.delay(delay or 0, function()
			local s = Instance.new("Sound")
			s.SoundId = id
			s.PlaybackSpeed = pitch
			s.Volume = vol
			s.Parent = parent
			s.RollOffMaxDistance = 0
			s:Play()
			game:GetService("Debris"):AddItem(s, 3)
		end)
	end

	local function playGlitchImpact()
		playSound("rbxassetid://1588058260", 1.0, 0.9, SoundService2, 0)
		playSound("rbxassetid://8627516764", 0.8, 0.7, SoundService2, 0.02)
		playSound("rbxassetid://1588058260", 1.4, 0.5, SoundService2, 0.05)
		playSound("rbxassetid://8627516764", 1.2, 0.4, SoundService2, 0.1)
	end

	local function playWhistle()
		local WHISTLE_ID = "rbxassetid://4612414100"
		playSound(WHISTLE_ID, 2.2, 0.7, SoundService2, 0)
		playSound(WHISTLE_ID, 1.7, 0.8, SoundService2, 0.07)
		playSound(WHISTLE_ID, 1.2, 0.9, SoundService2, 0.15)
		playSound(WHISTLE_ID, 0.85, 0.9, SoundService2, 0.24)
		playSound(WHISTLE_ID, 0.55, 0.7, SoundService2, 0.34)
		playSound(WHISTLE_ID, 0.3, 1.0, SoundService2, 0.5)
	end

	local function doShatterEffect()
		pcall(playGlitchImpact)
		local flash = Instance.new("Frame", splashGui)
		flash.Size = UDim2.new(1,0,1,0)
		flash.BackgroundColor3 = Color3.fromRGB(255,255,255)
		flash.BackgroundTransparency = 0.3
		flash.BorderSizePixel = 0
		flash.ZIndex = 8
		TweenService2:Create(flash, TweenInfo.new(0.18), {BackgroundTransparency=1}):Play()
		game:GetService("Debris"):AddItem(flash, 0.3)
		titleSplash.TextTransparency = 1
		local RunService2 = game:GetService("RunService")
		for i, frag in ipairs(fragments) do
			frag.TextTransparency = 0
			local dirX = (i - 3.5) * 60 + math.random(-80, 80)
			local dirY = math.random(120, 280)
			local rot = math.random(-180, 180)
			local startPosX = frag.Position.X.Offset
			local startPosY = frag.Position.Y.Offset
			local t = 0
			local conn
			conn = RunService2.RenderStepped:Connect(function(dt)
				t = t + dt
				if t > 0.8 then frag.TextTransparency = 1; conn:Disconnect(); return end
				local alpha = t / 0.8
				local px = startPosX + dirX * alpha
				local py = startPosY - dirY * alpha + 300 * alpha * alpha
				local fade = math.clamp(alpha * 1.4 - 0.3, 0, 1)
				frag.Position = UDim2.new(0.5, px, 0.5, py - 30)
				frag.Rotation = rot * alpha
				frag.TextTransparency = fade
				frag.TextSize = math.clamp(44 - alpha * 20, 10, 44)
			end)
		end
		for li = 1, 8 do
			task.delay(li * 0.025, function()
				local line = Instance.new("Frame", splashGui)
				line.Size = UDim2.new(1, 0, 0, math.random(2,6))
				line.Position = UDim2.new(0, 0, math.random(), 0)
				line.BackgroundColor3 = Color3.fromRGB(math.random(0,80), math.random(180,255), math.random(60,150))
				line.BackgroundTransparency = math.random() * 0.3
				line.BorderSizePixel = 0
				line.ZIndex = 7
				TweenService2:Create(line, TweenInfo.new(0.12), {BackgroundTransparency=1}):Play()
				game:GetService("Debris"):AddItem(line, 0.2)
			end)
		end
	end

	local splashDone = false
	local function finishSplash()
		if splashDone then return end
		splashDone = true
		TweenService2:Create(subSplash, TweenInfo.new(0.3), {TextTransparency=1}):Play()
		TweenService2:Create(overlay, TweenInfo.new(0.4), {BackgroundTransparency=1}):Play()
		tapHint.Visible = false
	end

	skipZone.MouseButton1Click:Connect(function()
		titleSplash.TextTransparency = 1
		subSplash.TextTransparency = 1
		finishSplash()
	end)

	task.spawn(function()
		TweenService2:Create(overlay, TweenInfo.new(0.2), {BackgroundTransparency=0.1}):Play()
		task.wait(0.15)
		pcall(playWhistle)
		TweenService2:Create(container, TweenInfo.new(0.45, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out),
			{Position=UDim2.new(0.5,-160,0.5,-60)}):Play()
		task.wait(0.5)
		doShatterEffect()
		task.wait(0.85)
		finishSplash()
		task.wait(0.45)
		if splashGui and splashGui.Parent then splashGui:Destroy() end
	end)

	local _t0 = tick()
	while not splashDone and (tick() - _t0) < 3.0 do
		task.wait(0.05)
	end
end

local env = (type(getgenv) == "function" and getgenv()) or _G

env.BlyxoGeneration = (env.BlyxoGeneration or 0) + 1

local BX = {
    generation  = env.BlyxoGeneration,
    version     = BLYXO_VERSION,
    build       = BLYXO_BUILD,
    _factories  = {},
    _loaded     = {},
    _loading    = {},
    _conns      = {},
}
env.BX = BX

function BX.alive()
    return env.BlyxoGeneration == BX.generation
end

function BX.module(name, factory)
    if BX._factories[name] then
        error(("duplicate module %q"):format(name), 2)
    end
    BX._factories[name] = factory
end

function BX.require(name)
    local cached = BX._loaded[name]
    if cached ~= nil then return cached end

    if BX._loading[name] then
        error(("circular dependency: %s"):format(name), 2)
    end
    local factory = BX._factories[name]
    if not factory then
        error(("no such module: %s"):format(name), 2)
    end

    BX._loading[name] = true
    local ok, result = pcall(factory, BX)
    BX._loading[name] = nil

    if not ok then

        error(("module %q failed to load: %s"):format(name, tostring(result)), 2)
    end
    if result == nil then
        error(("module %q returned nil (forgot to return M?)"):format(name), 2)
    end

    BX._loaded[name] = result
    return result
end

function BX.connect(signal, fn)
    local c = signal:Connect(fn)
    BX._conns[#BX._conns + 1] = c
    return c
end

function BX.offthread(fn, timeout)
    local done, result = false, nil
    task.spawn(function()
        local ok, r = pcall(fn)
        if ok then result = r end
        done = true
    end)

    local startedAt = os.clock()
    timeout = timeout or 5
    while not done and (os.clock() - startedAt) < timeout do
        task.wait(0.03)
    end
    return result, done
end

function BX.teardown()

    pcall(function()
        local lg = BX._loaded["boot.log"]
        if lg and lg.flushNow then lg.flushNow() end
    end)

    if BX.destroyAllScopes then pcall(BX.destroyAllScopes) end
    for _, c in ipairs(BX._conns) do
        pcall(function() c:Disconnect() end)
    end
    BX._conns = {}

    BX._loaded = {}
end

if type(env.BlyxoTeardown) == "function" then
    pcall(env.BlyxoTeardown)
end
env.BlyxoTeardown = BX.teardown

BX.module("boot.log", function(BX)
    local M = {}

    local TRACE_FILE  = "BlyxoHub_trace.txt"
    local FLUSH_GAP   = 1.0   
    local RING        = 500   

    local canWrite  = (type(writefile) == "function")
    local debugOn   = function()
        local env = (type(getgenv) == "function" and getgenv()) or _G
        return env.BlyxoDebug == true
    end

    local ring, ringN, ringHead = {}, 0, 0
    local flushAt     = 0
    local seen, seenN = {}, 0   
    local SEEN_MAX    = 400     

    M.LEVELS = { TRACE = 1, INFO = 2, WARN = 3, ERROR = 4 }
    M.level  = M.LEVELS.INFO

    local function stamp()
        return ("%7.2f"):format(os.clock())
    end

    local dirty = false

    local function writeNow()
        if not canWrite then return end
        flushAt = os.clock()
        dirty = false

        local out, n = {}, 0
        local start = (ringN < RING) and 1 or (ringHead % RING) + 1
        for i = 0, ringN - 1 do
            n = n + 1
            out[n] = ring[((start - 1 + i) % RING) + 1]
        end
        pcall(writefile, TRACE_FILE, table.concat(out, "\n", 1, n))
    end

    local function flush(force)
        if not canWrite then return end
        if force then return writeNow() end
        dirty = true
    end

    if canWrite then
        task.spawn(function()
            while BX.alive() do
                task.wait(FLUSH_GAP)
                if dirty then pcall(writeNow) end
            end
            if dirty then pcall(writeNow) end
        end)
    end

    function M.flushNow() pcall(writeNow) end

    local TAGS = { "TRACE", "INFO", "WARN", "ERROR" }

    local function emit(level, mod, msg)
        if level < M.level then return end
        local line = ("[%s] %-5s %-16s %s"):format(stamp(), TAGS[level], mod, msg)

        ringHead = (ringHead % RING) + 1
        ring[ringHead] = line
        if ringN < RING then ringN = ringN + 1 end

        if debugOn() or level >= M.LEVELS.WARN then
            print("[BLYXO] " .. line)
        end

        flush(level >= M.LEVELS.ERROR)
    end

    function M.for_module(name)
        return {
            trace = function(m, ...) emit(1, name, select("#", ...) > 0 and m:format(...) or m) end,
            info  = function(m, ...) emit(2, name, select("#", ...) > 0 and m:format(...) or m) end,
            warn  = function(m, ...) emit(3, name, select("#", ...) > 0 and m:format(...) or m) end,
            error = function(m, ...) emit(4, name, select("#", ...) > 0 and m:format(...) or m) end,
        }
    end

    function M.session(msg)
        emit(2, "session", "=== " .. msg .. " ===")
        flush(true)
    end

    function M.repeats()
        local out = {}
        for label, n in pairs(seen) do
            if n > 1 then out[#out + 1] = ("%s x%d"):format(label, n) end
        end
        table.sort(out)
        return out
    end

    function BX.try(label, fn, ...)
        local ok, result = pcall(fn, ...)
        if not ok then

            if seen[label] == nil then
                if seenN >= SEEN_MAX then
                    label = "(other)"
                else
                    seenN = seenN + 1
                end
            end
            local n = (seen[label] or 0) + 1
            seen[label] = n
            if n == 1 then
                emit(4, "try", ("%s: %s"):format(label, tostring(result)))
            elseif n == 10 or n == 100 or n == 1000 then
                emit(3, "try", ("%s: still failing (x%d)"):format(label, n))
            end
        end
        return ok, result
    end

    function BX.guard(label, fn)
        return function(...)
            return select(2, BX.try(label, fn, ...))
        end
    end

    M._emit = emit
    M._seen = seen
    return M
end)

BX._scopes = {}

function BX.scope(name)

    local existing = BX._scopes[name]
    if existing and not existing.dead then existing:destroy() end

    local sc = {
        name    = name,
        dead    = false,
        conns   = {},
        insts   = {},
        threads = {},
        tweens  = {},
        gen     = BX.generation,
    }

    function sc:alive()
        return (not self.dead) and BX.alive()
    end

    function sc:connect(signal, fn)
        if self.dead then return nil end
        local c = signal:Connect(fn)
        self.conns[#self.conns + 1] = c
        return c
    end

    function sc:own(inst)
        if self.dead then
            
            pcall(function() inst:Destroy() end)
            return inst
        end
        self.insts[#self.insts + 1] = inst
        return inst
    end

    function sc:spawn(label, fn, ...)
        if self.dead then return nil end
        local th
        th = task.spawn(function(...)
            BX.try(self.name .. "/" .. label, fn, ...)

            for i, t in ipairs(self.threads) do
                if t == th then table.remove(self.threads, i) break end
            end
        end, ...)
        self.threads[#self.threads + 1] = th
        return th
    end

    function sc:loop(label, interval, fn)
        return self:spawn(label .. "/loop", function()
            while self:alive() do
                BX.try(self.name .. "/" .. label, fn)
                if not self:alive() then return end
                task.wait(interval)
            end
        end)
    end

    function sc:onFrame(label, signal, fn)
        local tag = self.name .. "/" .. label
        local guarded = BX.guard(tag, fn)
        local timed = BX.profile and BX.profile.wrap(tag, guarded) or guarded
        return self:connect(signal, timed)
    end

    function sc:delay(label, seconds, fn)
        if self.dead then return end
        task.delay(seconds, function()

            if not self:alive() then return end
            BX.try(self.name .. "/" .. label, fn)
        end)
    end

    function sc:tween(obj, t, props, style, dir)
        if self.dead then return nil end
        local tween
        BX.try(self.name .. "/tween", function()
            tween = BX.require("core.services").TweenService:Create(obj,
                TweenInfo.new(t, style or Enum.EasingStyle.Quint,
                    dir or Enum.EasingDirection.Out), props)
            tween:Play()
        end)
        if tween then self.tweens[#self.tweens + 1] = tween end
        return tween
    end

    function sc:destroy()
        if self.dead then return end
        self.dead = true

        for _, c in ipairs(self.conns) do pcall(function() c:Disconnect() end) end
        for _, t in ipairs(self.tweens) do pcall(function() t:Cancel() end) end
        for _, i in ipairs(self.insts) do pcall(function() i:Destroy() end) end

        local me = coroutine.running()
        for _, th in ipairs(self.threads) do

            if th ~= me then pcall(task.cancel, th) end
        end

        self.conns, self.insts, self.threads, self.tweens = {}, {}, {}, {}

        if BX._scopes[self.name] == self then BX._scopes[self.name] = nil end
    end

    function sc:counts()
        return {
            conns   = #self.conns,
            insts   = #self.insts,
            threads = #self.threads,
            tweens  = #self.tweens,
        }
    end

    BX._scopes[name] = sc
    return sc
end

function BX.scopeReport()
    local out = {}
    for name, sc in pairs(BX._scopes) do
        if not sc.dead then
            local c = sc:counts()
            out[#out + 1] = ("%-24s conns=%-3d insts=%-4d threads=%-3d tweens=%d")
                :format(name, c.conns, c.insts, c.threads, c.tweens)
        end
    end
    table.sort(out)
    return out
end

function BX.destroyAllScopes()
    for _, sc in pairs(BX._scopes) do
        pcall(function() sc:destroy() end)
    end
    BX._scopes = {}
end

BX.profile = {
    enabled = true,
    _stats  = {},    
    _mem0   = nil,
    _t0     = os.clock(),
}

local P = BX.profile

P._watch = {}
function P.watch(name, fn) P._watch[name] = fn end
function P.watched()
    local out = {}
    for name, fn in pairs(P._watch) do
        local ok, n = pcall(fn)
        out[#out + 1] = ("%s=%s"):format(name, ok and tostring(n) or "?")
    end
    table.sort(out)
    return out
end

P._marks = {}

function P.mark(name)
    local ok, health, state, swapped = pcall(function()
        local plr = game:GetService("Players").LocalPlayer
        local char = plr and plr.Character
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not hum then return -1, "no-humanoid", false end
        return hum.Health, tostring(hum:GetState()):gsub("Enum.HumanoidStateType.", ""),
               hum:GetAttribute("BlyxoStealHum") == true
    end)
    local row = {
        name = name, at = os.clock(),
        health = ok and health or -1,
        state = ok and state or "?",
        swapped = ok and swapped or false,
    }
    P._marks[#P._marks + 1] = row
    if #P._marks > 200 then table.remove(P._marks, 1) end
    return row
end

function P.marksSince(t)
    local out = {}
    for _, r in ipairs(P._marks) do
        if r.at >= (t or 0) then
            out[#out + 1] = ("%s@%.2f hp=%.0f %s%s"):format(
                r.name, r.at - (t or 0), r.health, r.state, r.swapped and " swapped" or "")
        end
    end
    return out
end

function P.wrap(label, fn)
    local s = P._stats[label]
    if not s then
        s = { n = 0, total = 0, max = 0, last = 0 }
        P._stats[label] = s
    end
    return function(...)
        if not P.enabled then return fn(...) end
        local t0 = os.clock()
        fn(...)
        local dt = os.clock() - t0
        s.n = s.n + 1
        s.total = s.total + dt
        s.last = dt
        if dt > s.max then s.max = dt end
    end
end

function P.report()
    local rows = {}
    for label, s in pairs(P._stats) do
        if s.n > 0 then
            rows[#rows + 1] = {
                label = label,
                avg   = (s.total / s.n) * 1000,
                max   = s.max * 1000,
                total = s.total,
                n     = s.n,
            }
        end
    end
    table.sort(rows, function(a, b) return a.total > b.total end)

    local out = { ("%-34s %8s %8s %9s %8s"):format("per-frame job", "avg ms", "max ms", "total s", "calls") }
    for _, r in ipairs(rows) do
        out[#out + 1] = ("%-34s %8.3f %8.3f %9.2f %8d")
            :format(r.label, r.avg, r.max, r.total, r.n)
    end
    return out
end

local function memMb()
    local ok, v = pcall(function()
        return game:GetService("Stats"):GetTotalMemoryUsageMb()
    end)
    if ok and type(v) == "number" then return v end
    ok, v = pcall(gcinfo)
    return (ok and type(v) == "number") and (v / 1024) or 0
end

function P.health()
    local conns, threads, scopes, insts = 0, 0, 0, 0
    for _, sc in pairs(BX._scopes or {}) do
        if not sc.dead then
            scopes = scopes + 1
            local c = sc:counts()
            conns   = conns + c.conns
            insts   = insts + c.insts
            threads = threads + c.threads
        end
    end
    local mem = memMb()
    P._mem0 = P._mem0 or mem
    return {
        uptime  = os.clock() - P._t0,
        mem     = mem,
        memGrow = mem - P._mem0,
        scopes  = scopes,
        conns   = conns,
        insts   = insts,
        threads = threads,
        loaded  = (function() local n = 0 for _ in pairs(BX._loaded) do n = n + 1 end return n end)(),
    }
end

function P.start()
    local sc  = BX.scope("boot.profile")
    local log = BX.require("boot.log").for_module("profile")
    local fps, frames, last = 0, 0, os.clock()

    sc:connect(BX.require("core.services").RunService.Heartbeat, function()
        frames = frames + 1
    end)

    sc:loop("health", 60, function()
        local now = os.clock()
        fps, frames, last = frames / math.max(now - last, 0.001), 0, now
        local h = P.health()

        local w = P.watched()
        log.info("health up=%.0fs fps=%.0f mem=%.0fMB (%+.0f) scopes=%d conns=%d insts=%d threads=%d%s",
            h.uptime, fps, h.mem, h.memGrow, h.scopes, h.conns, h.insts, h.threads,
            #w > 0 and (" | " .. table.concat(w, " ")) or "")
    end)

    return sc
end

BX.module("core.services", function(BX)
    local log = BX.require("boot.log").for_module("services")
    local M = {}

    local WANTED = {
        "Players", "ReplicatedStorage", "RunService", "TweenService",
        "UserInputService", "Lighting", "Workspace", "HttpService",
        "CoreGui", "TextService", "Stats",

        "TeleportService",
    }

    for _, name in ipairs(WANTED) do
        local ok, svc = pcall(game.GetService, game, name)
        if ok and svc then
            M[name] = svc
        else

            log.error("service unavailable: %s", name)
        end
    end

    if M.Players and not M.Players.LocalPlayer then
        local deadline = os.clock() + 10
        while not M.Players.LocalPlayer and os.clock() < deadline do task.wait(0.1) end
        if M.Players.LocalPlayer then
            log.info("LocalPlayer arrived late (%.1fs) - waited for it", 10 - (deadline - os.clock()))
        else
            log.error("Players.LocalPlayer is still nil after 10s")
        end
    end
    M.LocalPlayer = M.Players and M.Players.LocalPlayer
    return M
end)

BX.module("core.net", function(BX)
    local svc = BX.require("core.services")
    local log = BX.require("boot.log").for_module("net")

    local M = {}

    local container, containerAt = nil, 0
    local CONTAINER_TTL = 30

    local function networking()
        local now = os.clock()
        if container and container.Parent and (now - containerAt) < CONTAINER_TTL then
            return container
        end
        local pkgs = svc.ReplicatedStorage:FindFirstChild("Packages")
        local net = pkgs and pkgs:FindFirstChild("Networking")
        container, containerAt = net, now
        return net
    end

    function M.find(name)
        local net = networking()
        return net and net:FindFirstChild(name) or nil
    end

    function M.call(name, ...)
        local rf = M.find(name)
        if not rf then return false, "remote not found: " .. tostring(name) end
        local ok, a, b = pcall(function(...) return rf:InvokeServer(...) end, ...)
        if not ok then return false, tostring(a) end
        return a, b
    end

    function M.fire(name, ...)
        local re = M.find(name)
        if not re then return false, "remote not found: " .. tostring(name) end
        local ok, err = pcall(function(...) re:FireServer(...) end, ...)
        if not ok then return false, tostring(err) end
        return true
    end

    return M
end)

BX.module("core.data", function(BX)
    local svc  = BX.require("core.services")
    local exec = BX.require("core.exec")
    local log  = BX.require("boot.log").for_module("data")

    local M = {}

    local cache = {}      

    local function atPath(...)
        local node = svc.ReplicatedStorage
        for _, part in ipairs({ ... }) do
            if not node then return nil end
            node = node:FindFirstChild(part)
        end
        return node
    end

    local function searchModule(name)
        for _, d in ipairs(svc.ReplicatedStorage:GetDescendants()) do
            if d:IsA("ModuleScript") and d.Name == name then return d end
        end
        return nil
    end

    local function resolve(key, path)
        local held = cache[key]
        if held then return held.mod end

        if not exec.can.gameRequire then
            log.error("cannot require game modules on this executor (%s) - %s unavailable",
                tostring(exec.gameRequireWhy), path[#path])
            cache[key] = { missing = true }
            return nil
        end

        local name = path[#path]
        local inst = atPath(table.unpack(path))
        if not (inst and inst:IsA("ModuleScript")) then
            inst = searchModule(name)
            if inst then
                log.warn("%s was not at %s - found it at %s",
                    name, table.concat(path, "."), inst:GetFullName())
            end
        end

        if not inst then
            cache[key] = { missing = true }
            log.error("could not resolve the game module %s (expected %s)",
                name, table.concat(path, "."))
            return nil
        end

        local mod
        local ok = BX.try("data.require." .. key, function() mod = require(inst) end)
        if not ok or type(mod) ~= "table" then
            cache[key] = { missing = true }
            log.error("%s could not be required", inst:GetFullName())
            return nil
        end

        cache[key] = { mod = mod }
        return mod
    end

    function M.assets()        return resolve("assets", { "Data", "Assets" }) end
    function M.areas()         return resolve("areas", { "Data", "Areas" }) end
    function M.eggState()      return resolve("eggState", { "Client", "EggState" }) end
    function M.assetEarnings() return resolve("assetEarnings", { "Shared", "Util", "AssetEarnings" }) end
    function M.plotState()     return resolve("plotState", { "Client", "PlotState" }) end
    function M.slotIdentity()  return resolve("slotIdentity", { "Shared", "Util", "AreaEggSlotIdentity" }) end

    function M.assetsDir()
        local a = M.assets()
        return a and a.Directory or nil
    end

    function M.areasDir()
        local a = M.areas()
        return a and a.Directory or nil
    end

    function M.report()
        local out = {}
        for key, held in pairs(cache) do
            out[#out + 1] = key .. (held.missing and "=MISSING" or "=ok")
        end
        table.sort(out)
        return out
    end

    return M
end)

BX.module("core.profiles", function(BX)
    local svc  = BX.require("core.services")
    local exec = BX.require("core.exec")
    local log  = BX.require("boot.log").for_module("profiles")

    local M = {}

    local FORMAT = 1
    local DIR = "BlyxoHub/profiles"
    local SETTINGS = "BlyxoHub/settings.json"

    M.FORMAT = FORMAT

    local SKIP_KEYS = { "url", "token", "secret", "key", "password" }

    local ALLOW = {
        AntiTreadmill  = true,   
        FarmAreas      = true,   
        FarmRarities   = true,   
        FarmTargetBy   = true,   
        WebhookOn      = true,   
        Theme          = true,   
        Background     = true,   
    }
    M.ALLOW = ALLOW

    local function skipped(name)
        if not ALLOW[name] then return true end
        local n = tostring(name):lower()
        for _, bad in ipairs(SKIP_KEYS) do
            if n:find(bad, 1, true) then return true end
        end
        return false
    end

    function M.available()
        return exec.can.files and exec.can.folders and true or false
    end

    local listing, listingOk = {}, false

    local function safeName(name)
        name = tostring(name or ""):gsub("[^%w%-_ ]", ""):gsub("^%s+", ""):gsub("%s+$", "")
        return name
    end

    local function pathFor(name)
        return DIR .. "/" .. name .. ".json"
    end

    function M.refresh()
        listing, listingOk = {}, false
        if not M.available() then return listing end
        BX.try("profiles.refresh", function()
            exec.ensureFolder("BlyxoHub")
            exec.ensureFolder(DIR)
            local files = exec.listFiles(DIR)
            if not files then
                log.warn("this executor has no listfiles - saved profiles cannot be listed")
                return
            end
            for _, f in ipairs(files) do
                local name = tostring(f):match("([^/\\]+)%.json$")
                if name then listing[#listing + 1] = name end
            end
            table.sort(listing)
            listingOk = true
        end)
        return listing
    end

    function M.list()
        if not listingOk then M.refresh() end
        return listing
    end

    local flagSource = nil
    function M.setFlagSource(fn) flagSource = fn end

    local appearanceSource, appearanceApply = nil, nil
    function M.setAppearanceHooks(read, apply)
        appearanceSource, appearanceApply = read, apply
    end

    local function collectFlags()
        local out = {}
        if type(flagSource) ~= "function" then return out end
        local ok, flags = pcall(flagSource)
        if not ok or type(flags) ~= "table" then return out end
        for name, el in pairs(flags) do
            if not skipped(name) then

                local v
                if type(el) == "table" then
                    v = el.CurrentValue
                    if v == nil then v = el.Value end
                    if v == nil then v = el.value end
                else
                    v = el
                end
                local t = type(v)

                if t == "boolean" or t == "number" or t == "string" then
                    out[tostring(name)] = v
                elseif t == "table" then
                    local copy = {}
                    for i, item in ipairs(v) do
                        if type(item) == "string" or type(item) == "number" then
                            copy[i] = item
                        end
                    end
                    out[tostring(name)] = copy
                end
            end
        end
        return out
    end

    function M.save(name)
        if not M.available() then return false, "This executor cannot save files" end
        name = safeName(name)
        if name == "" then return false, "Give the profile a name" end

        local payload = {
            version = FORMAT,
            saved = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            build = tostring(BX.build),
            flags = collectFlags(),
            appearance = (type(appearanceSource) == "function")
                and select(2, pcall(appearanceSource)) or nil,
        }

        local body
        local okEnc = pcall(function() body = svc.HttpService:JSONEncode(payload) end)
        if not okEnc or not body then return false, "Could not encode the profile" end

        local path = pathFor(name)
        local ok = BX.try("profiles.save", function()
            exec.ensureFolder("BlyxoHub")
            exec.ensureFolder(DIR)
            if not exec.writeFile(path, body) then error("writefile refused", 0) end
        end)
        if not ok then return false, "Could not write the profile" end

        if not exec.isFile(path) then
            log.warn("profile %q: writefile returned but isfile says no", name)
            return false, "Written but not found - this executor's file access is broken"
        end
        local back = exec.readFile(path)
        if back ~= body then
            log.warn("profile %q: readback mismatch (%d vs %d bytes)", name,
                type(back) == "string" and #back or -1, #body)
            return false, "Written but readback differs - not saved"
        end

        M.refresh()
        log.info("saved profile %q (%d flags)", name, (function()
            local n = 0 for _ in pairs(payload.flags) do n = n + 1 end return n
        end)())
        return true, "Saved " .. name
    end

    function M.load(name)
        if not M.available() then return false, "This executor cannot read files" end
        name = safeName(name)
        if name == "" then return false, "Pick a profile" end
        local path = pathFor(name)
        if not exec.isFile(path) then return false, "No profile called " .. name end

        local body = exec.readFile(path)
        if type(body) ~= "string" or body == "" then
            return false, name .. " is empty"
        end

        local data
        local okDec = pcall(function() data = svc.HttpService:JSONDecode(body) end)
        if not okDec or type(data) ~= "table" then
            log.warn("profile %q is not valid JSON - refusing it", name)
            return false, name .. " is corrupt"
        end

        local v = tonumber(data.version) or 0
        if v > FORMAT then
            return false, name .. " was saved by a newer version"
        end
        if v < FORMAT then
            
            log.info("profile %q is format %d, current is %d - loading as-is", name, v, FORMAT)
        end

        local applied = 0
        if type(data.flags) == "table" and type(flagSource) == "function" then
            local ok, flags = pcall(flagSource)
            if ok and type(flags) == "table" then
                for key, value in pairs(data.flags) do

                    local el = (not skipped(key)) and flags[key] or nil

                    if type(el) == "table" and type(el.Set) == "function" then
                        if BX.try("profiles.set." .. tostring(key), function()
                            el:Set(value)
                        end) then
                            applied = applied + 1
                        end
                    end
                end
            end
        end

        if type(data.appearance) == "table" and type(appearanceApply) == "function" then
            BX.try("profiles.appearance", function() appearanceApply(data.appearance) end)
        end

        log.info("loaded profile %q (%d controls)", name, applied)
        return true, ("Loaded %s (%d settings)"):format(name, applied)
    end

    function M.delete(name)
        if not M.available() then return false, "This executor cannot delete files" end
        name = safeName(name)
        local path = pathFor(name)
        if name == "" or not exec.isFile(path) then return false, "No such profile" end
        local ok = BX.try("profiles.delete", function() exec.deleteFile(path) end)
        M.refresh()

        if not ok then return false, "Could not delete " .. name end
        log.info("deleted profile %q", name)
        return true, "Deleted " .. name
    end

    local function readSettings()
        if not M.available() or not exec.isFile(SETTINGS) then return {} end
        local body = exec.readFile(SETTINGS)
        local data
        pcall(function() data = svc.HttpService:JSONDecode(body) end)
        return type(data) == "table" and data or {}
    end

    function M.autoLoadName()
        local s = readSettings()
        local n = s.autoLoad
        return type(n) == "string" and n ~= "" and n or nil
    end

    function M.setAutoLoad(name)
        if not M.available() then return false, "This executor cannot save files" end
        name = safeName(name)
        local s = readSettings()
        s.autoLoad = (name ~= "" and name) or nil
        s.version = FORMAT
        local body
        if not pcall(function() body = svc.HttpService:JSONEncode(s) end) then
            return false, "Could not save the setting"
        end
        BX.try("profiles.settings", function()
            exec.ensureFolder("BlyxoHub")
            exec.writeFile(SETTINGS, body)
        end)
        log.info("auto-load profile is now %s", name ~= "" and ("%q"):format(name) or "off")
        return true, name ~= "" and ("Auto-loading " .. name) or "Auto-load off"
    end

    local autoLoadRan = false
    function M.runAutoLoad()
        if autoLoadRan then return false, "already ran" end
        autoLoadRan = true
        local name = M.autoLoadName()
        if not name then return false, "no auto-load profile set" end
        local ok, msg = M.load(name)
        if not ok then log.warn("auto-load failed: %s", tostring(msg)) end
        return ok, msg
    end

    return M
end)

BX.module("core.exec", function(BX)
    local log = BX.require("boot.log").for_module("exec")

    local M = {}

    local env = (type(getgenv) == "function" and getgenv()) or _G
    local deny = type(env.BLYXO_CAPS_DENY) == "table" and env.BLYXO_CAPS_DENY or {}
    M.simulatedDenies = deny

    local function fn(name)
        if deny[name] then return nil end
        local ok, v
        ok, v = pcall(function() return type(getgenv) == "function" and getgenv()[name] or nil end)
        if not ok or type(v) ~= "function" then
            ok, v = pcall(function() return getfenv and getfenv()[name] or nil end)
        end
        if not ok or type(v) ~= "function" then
            ok, v = pcall(function() return (_G and _G[name]) end)
        end
        if not ok or type(v) ~= "function" then
            ok, v = pcall(function()
                local chunk = loadstring and loadstring("return " .. name)
                return chunk and chunk() or nil
            end)
        end
        return (ok and type(v) == "function") and v or nil
    end

    local function first(...)
        for _, name in ipairs({ ... }) do
            local f = fn(name)
            if f then return f, name end
        end
        return nil, nil
    end

    local f_writefile   = first("writefile")
    local f_readfile    = first("readfile")
    local f_isfile      = first("isfile")
    local f_delfile     = first("delfile")
    local f_isfolder    = first("isfolder")
    local f_makefolder  = first("makefolder")
    local f_listfiles   = first("listfiles")
    local f_customasset = first("getcustomasset", "getsynasset")
    local f_gethui      = first("gethui")
    local f_getgc       = first("getgc")
    local f_getconns    = first("getconnections")
    local f_hookfn      = first("hookfunction", "replaceclosure")
    local f_getrawmeta  = first("getrawmetatable")
    local f_setreadonly = first("setreadonly", "make_writeable")
    local f_queueport   = first("queue_on_teleport", "queueonteleport")
    local f_identify    = first("identifyexecutor", "getexecutorname")
    local f_fireprompt  = first("fireproximityprompt")

    local f_clip, clipName = first("setclipboard", "toclipboard", "set_clipboard", "setrbxclipboard")

    local canRequire, requireWhy = false, "no ModuleScript to probe"
    do
        local ok, err = pcall(function()
            local RS = game:GetService("ReplicatedStorage")
            local probe = RS:FindFirstChildWhichIsA("ModuleScript", true)
            if not probe then return end
            local r = require(probe)
            canRequire, requireWhy = true, probe:GetFullName()
        end)
        if not ok then requireWhy = tostring(err) end
        if deny.gameRequire then canRequire, requireWhy = false, "simulated deny" end
    end

    local f_request, requestName
    do
        local ok, v = pcall(function() return syn and syn.request end)
        if ok and type(v) == "function" then
            f_request, requestName = v, "syn.request"
        else
            ok, v = pcall(function() return http and http.request end)
            if ok and type(v) == "function" then
                f_request, requestName = v, "http.request"
            else
                f_request, requestName = first("request", "http_request", "httprequest")
            end
        end
    end

    M.can = {
        files      = (f_writefile and f_readfile and f_isfile) and true or false,
        folders    = (f_isfolder and f_makefolder) and true or false,
        listFiles  = f_listfiles and true or false,
        customAsset = f_customasset and true or false,
        hiddenUi   = f_gethui and true or false,
        gc         = f_getgc and true or false,
        connections = f_getconns and true or false,
        hooking    = (f_hookfn and f_getrawmeta) and true or false,
        clipboard  = f_clip and true or false,
        request    = f_request and true or false,
        teleportQueue = f_queueport and true or false,

        prompts    = true,
        gameRequire = canRequire,
    }
    M.promptVia = f_fireprompt and "fireproximityprompt" or "InputHoldBegin"
    M.gameRequireWhy = requireWhy

    M.name = "unknown"
    if f_identify then
        local ok, n = pcall(f_identify)
        if ok and type(n) == "string" and #n > 0 then M.name = n end
    end

    function M.hiddenParent()
        if f_gethui then
            local ok, ui = pcall(f_gethui)
            if ok and ui then return ui end
        end
        return BX.require("core.services").CoreGui
    end

    function M.writeFile(path, data)
        if not f_writefile then return false end
        return (BX.try("exec.writeFile", f_writefile, path, data))
    end

    function M.readFile(path)
        if not f_readfile then return nil end
        local ok, data = BX.try("exec.readFile", f_readfile, path)
        return ok and data or nil
    end

    function M.isFile(path)
        if not f_isfile then return false end
        local ok, yes = pcall(f_isfile, path)
        return ok and yes or false
    end

    function M.listFiles(path)
        if not f_listfiles then return nil end
        local ok, files = BX.try("exec.listFiles", f_listfiles, path)
        if not ok or type(files) ~= "table" then return nil end
        return files
    end

    function M.deleteFile(path)
        if not f_delfile then return false end
        return (BX.try("exec.deleteFile", f_delfile, path))
    end

    function M.ensureFolder(path)
        if not M.can.folders then return false end
        local built = ""
        for part in tostring(path):gmatch("[^/]+") do
            built = (built == "") and part or (built .. "/" .. part)
            local ok, exists = pcall(f_isfolder, built)
            if ok and not exists then
                if not BX.try("exec.makeFolder", f_makefolder, built) then return false end
            end
        end
        return true
    end

    function M.customAsset(path)
        if not f_customasset then return nil end
        local ok, id = BX.try("exec.customAsset", f_customasset, path)
        return ok and id or nil
    end

    function M.clipboard(text)
        for _, name in ipairs({ "setclipboard", "toclipboard", "set_clipboard", "setrbxclipboard" }) do
            local f = fn(name)
            if f and pcall(f, text) then return true end
        end
        return false
    end

    function M.httpRequest(opts)
        if not f_request then return nil end
        local ok, res = BX.try("exec.httpRequest", f_request, opts)
        return ok and res or nil
    end

    function M.gcScan(tablesOnly)
        if not f_getgc then return {} end
        local t0 = os.clock()
        local ok, objs = BX.try("exec.gcScan", f_getgc, tablesOnly and true or false)
        if not ok or type(objs) ~= "table" then return {} end
        local ms = (os.clock() - t0) * 1000
        M.lastGcMs = ms

        log.warn("gc sweep: %d objects in %.0fms", #objs, ms)
        return objs
    end

    function M.firePrompt(prompt, holdDuration)
        if f_fireprompt then
            return (BX.try("exec.firePrompt", f_fireprompt, prompt, holdDuration or 0))
        end

        return (BX.try("exec.firePrompt.hold", function()
            prompt:InputHoldBegin()
            local hold = tonumber(holdDuration)
            if hold == nil then hold = tonumber(prompt.HoldDuration) or 0 end
            if hold > 0 then task.wait(hold + 0.05) end
            prompt:InputHoldEnd()
        end))
    end

    function M.report()
        local have, missing = {}, {}
        for k, v in pairs(M.can) do
            table.insert(v and have or missing, k)
        end
        table.sort(have); table.sort(missing)
        local denied = {}
        for k in pairs(deny) do denied[#denied + 1] = tostring(k) end
        table.sort(denied)
        return {
            executor = M.name,
            have = have,
            missing = missing,
            denied = denied,
            promptVia = M.promptVia,
            gameRequireWhy = requireWhy,
        }
    end

    local r = M.report()
    log.info("executor=%s clipboard=%s request=%s prompts=%s gameRequire=%s (%s)",
        M.name, tostring(clipName), tostring(requestName), M.promptVia,
        tostring(canRequire), tostring(requireWhy))
    if #r.denied > 0 then
        log.warn("SIMULATED capability denies active: %s", table.concat(r.denied, ", "))
    end
    log.info("supported: %s", #r.have > 0 and table.concat(r.have, ", ") or "(none)")
    if #r.missing > 0 then

        log.warn("unsupported here: %s", table.concat(r.missing, ", "))
    end

    return M
end)

BX.module("core.device", function(BX)
    local svc = BX.require("core.services")
    local cfg = BX.require("core.config")
    local log = BX.require("boot.log").for_module("device")

    local M = {}

    M.isTouch = svc.UserInputService.TouchEnabled
        and not svc.UserInputService.KeyboardEnabled

    local function shortSide()
        local cam = workspace.CurrentCamera
        local vp = cam and cam.ViewportSize
        if not vp or vp.Y < 10 then return 1080 end
        return math.min(vp.X, vp.Y)
    end
    M.smallScreen = shortSide() < 500

    M.tier = (M.isTouch and M.smallScreen) and "low" or "mid"
    M.fps = nil

    local MULT = { low = 2.2, mid = 1.35, high = 1.0 }

    function M.scale(seconds)
        return seconds * (MULT[M.tier] or 1.35)
    end

    function M.budget(n)
        local share = (M.tier == "low" and 0.35) or (M.tier == "mid" and 0.7) or 1
        return math.max(1, math.floor(n * share + 0.5))
    end

    function M.lite()
        return M.tier == "low"
    end

    local listeners = {}
    function M.onTier(sc, label, fn)
        listeners[#listeners + 1] = { scope = sc, label = label, fn = fn }
    end

    local function setTier(t)
        if M.tier == t then return end
        local was = M.tier
        M.tier = t
        log.info("tier %s -> %s (fps %.0f, touch=%s, short=%d)",
            was, t, M.fps or -1, tostring(M.isTouch), shortSide())
        for i = #listeners, 1, -1 do
            local L = listeners[i]
            if not L.scope or L.scope.dead then
                table.remove(listeners, i)
            else
                BX.try("device/" .. L.label, L.fn, t, was)
            end
        end
    end

    local sc = BX.scope("core.device")
    local frames = 0
    sc:connect(svc.RunService.Heartbeat, function() frames = frames + 1 end)

    local pending, pendingCount = nil, 0
    sc:loop("measure", 5, function()
        local fps = frames / 5
        frames = 0
        M.fps = M.fps and (M.fps + (fps - M.fps) * 0.4) or fps

        local want = M.tier
        if M.tier == "high" then
            if M.fps < 45 then want = "mid" end
        elseif M.tier == "mid" then
            if M.fps < cfg.LITE_FPS then want = "low"
            elseif M.fps > 75 then want = "high" end
        else
            if M.fps > 40 then want = "mid" end
        end

        if want == "high" and M.isTouch and M.smallScreen then want = "mid" end

        if want == M.tier then
            pending, pendingCount = nil, 0
            return
        end
        if pending == want then
            pendingCount = pendingCount + 1
        else
            pending, pendingCount = want, 1
        end
        if pendingCount >= 2 then
            setTier(want)
            pending, pendingCount = nil, 0
        end
    end)

    log.info("start tier=%s touch=%s smallScreen=%s", M.tier,
        tostring(M.isTouch), tostring(M.smallScreen))

    return M
end)

BX.module("core.character", function(BX)
    local svc = BX.require("core.services")
    local log = BX.require("boot.log").for_module("character")

    local M = {}
    local plr = svc.LocalPlayer

    local current = setmetatable({}, { __mode = "v" })

    local listeners = {}   

    function M.get()
        local c = current.char

        if c and c.Parent then return c end
        return plr and plr.Character
    end

    function M.root()
        local c = M.get()
        return c and c:FindFirstChild("HumanoidRootPart")
    end

    function M.humanoid()
        local c = M.get()
        return c and c:FindFirstChildOfClass("Humanoid")
    end

    local function fire(char)
        current.char = char

        for i = #listeners, 1, -1 do
            local L = listeners[i]
            if not L.scope or L.scope.dead then
                table.remove(listeners, i)
            else
                BX.try(("character/%s"):format(L.label), L.fn, char)
            end
        end
    end

    function M.onSpawn(sc, label, fn)
        listeners[#listeners + 1] = { scope = sc, label = label, fn = fn }

        local c = M.get()
        if c then BX.try(("character/%s"):format(label), fn, c) end
    end

    local sc = BX.scope("core.character")
    if plr then
        sc:connect(plr.CharacterAdded, function(char)
            log.trace("respawn")

            task.spawn(function()
                BX.try("character/wait", function()
                    char:WaitForChild("HumanoidRootPart", 10)
                end)
                if BX.alive() then fire(char) end
            end)
        end)
        sc:connect(plr.CharacterRemoving, function()
            current.char = nil
        end)
        current.char = plr.Character
    else
        log.error("no LocalPlayer - character tracking unavailable")
    end

    M._listenerCount = function() return #listeners end
    return M
end)

BX.module("core.restore", function(BX)
    local ch  = BX.require("core.character")
    local log = BX.require("boot.log").for_module("restore")

    local M = {}

    local entries = {}     
    local order = {}       

    BX.profile.watch("restore.pending", function() return #order end)

    function M.remember(key, read, write)
        if entries[key] then return false end
        local ok, value = pcall(read)
        if not ok then
            log.warn("could not read %s to remember it: %s", key, tostring(value))
            return false
        end
        entries[key] = {
            read = read, write = write, original = value,
            char = ch.get(), at = os.clock(),
        }
        order[#order + 1] = key
        return true
    end

    function M.onRestore(key, undo)
        if entries[key] then return false end
        entries[key] = { undo = undo, char = ch.get(), at = os.clock() }
        order[#order + 1] = key
        return true
    end

    function M.permanent(key, why)
        if entries[key] then return false end
        entries[key] = { permanent = why or "not reversible", char = ch.get() }
        order[#order + 1] = key
        return true
    end

    function M.restoreAll()
        local restored, skipped, failed = 0, 0, 0
        local liveChar = ch.get()

        for i = #order, 1, -1 do
            local key = order[i]
            local e = entries[key]
            if e then
                if e.permanent then
                    skipped = skipped + 1
                elseif e.char and e.char ~= liveChar then

                    skipped = skipped + 1
                else
                    local ok, err = pcall(function()
                        if e.undo then e.undo() else e.write(e.original) end
                    end)
                    if ok then
                        restored = restored + 1
                    else
                        failed = failed + 1
                        log.error("restoring %s failed: %s", key, tostring(err))
                    end
                end
                entries[key] = nil
            end
            table.remove(order, i)
        end

        return restored, skipped, failed
    end

    function M.audit()
        local diffs = {}
        for _, key in ipairs(order) do
            local e = entries[key]
            if e and e.read then
                local ok, now = pcall(e.read)
                if ok and tostring(now) ~= tostring(e.original) then
                    diffs[#diffs + 1] = ("%s: %s (was %s)")
                        :format(key, tostring(now), tostring(e.original))
                end
            elseif e and e.permanent then
                diffs[#diffs + 1] = ("%s: %s"):format(key, e.permanent)
            end
        end
        return diffs
    end

    function M.pending()
        return #order
    end

    local sc = BX.scope("core.restore")
    ch.onSpawn(sc, "restore.respawn", function(char)
        local dropped = 0
        for i = #order, 1, -1 do
            local key = order[i]
            local e = entries[key]
            if e and e.char and e.char ~= char then
                entries[key] = nil
                table.remove(order, i)
                dropped = dropped + 1
            end
        end
        if dropped > 0 then
            log.trace("dropped %d entries captured against the old character", dropped)
        end
    end)

    return M
end)

BX.module("core.config", function(BX)
    return {

        CARRY_SPEED        = 500,
        OUTBOUND_SPEED_MIN = 500,
        OUTBOUND_SPEED_MAX = 1200,

        LITE_FPS           = 25,

        STATS_HZ           = 4,

        LOG_LEVEL          = 2,

        DEFAULT_BACKGROUND = "108858454360177",
    }
end)

BX.module("core.state", function(BX)
    return {
        heldEggUid   = nil,    
        autoStealOn  = false,  

        stayOnTreadmill = false,
        lastFps      = 0,      
        startedAt    = os.clock(),
    }
end)

BX.module("core.util", function(BX)
    local M = {}

    function M.clamp(v, lo, hi)
        return math.max(lo, math.min(hi, v))
    end

    function M.round(v, places)
        local m = 10 ^ (places or 0)
        return math.floor(v * m + 0.5) / m
    end

    function M.wait(seconds)
        task.wait(seconds)
        return BX.alive()
    end

    function M.short(n)
        if n >= 1e6 then return ("%.1fM"):format(n / 1e6) end
        if n >= 1e3 then return ("%.1fk"):format(n / 1e3) end
        return tostring(math.floor(n))
    end

    return M
end)

BX.module("ui.window", function(BX)
    local exec = BX.require("core.exec")
    local svc  = BX.require("core.services")
    local log  = BX.require("boot.log").for_module("window")

    local M = { ok = false }

    local URLS = {
        "https://sirius.menu/gen2",
        "https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua",
    }

    local Rayfield, lastErr
    for attempt = 1, 4 do
        for _, url in ipairs(URLS) do
            local ok, res = pcall(function() return game:HttpGet(url) end)
            if ok and type(res) == "string" and #res > 1000 then
                local okLoad, lib = pcall(function() return loadstring(res)() end)
                if okLoad and type(lib) == "table" then
                    Rayfield = lib
                    break
                end
                lastErr = "loadstring failed: " .. tostring(lib)
            else
                lastErr = tostring(res)
            end
        end
        if Rayfield then break end
        log.warn("UI host attempt %d/4 failed: %s", attempt, tostring(lastErr))
        task.wait(attempt * 1.5)
    end

    if not Rayfield then
        log.error("could not load the UI library: %s", tostring(lastErr))
        M.error = "Menu host is down - try again in a minute"
        return M
    end

    local env = (type(getgenv) == "function" and getgenv()) or _G
    pcall(function()
        if env.__BLYXO_WINDOW and not env.__BLYXO_WINDOW.unloaded then
            env.__BLYXO_WINDOW:Unload()
        end
    end)

    local okWin, window = pcall(function()
        return Rayfield:CreateWindow({
            name = "BlyxoHub",
            subtitle = "Steal An Egg",
            icon = 95108798243406,
            showName = "BlyxoHub",
            sidebarLayout = true,
            profile = "Premium",
            theme = {
                AccentColor     = Color3.fromRGB(255, 255, 255),
                AccentStroke    = Color3.fromRGB(40, 40, 40),
                AccentGlow      = 0.1,
                TextColor       = Color3.fromRGB(220, 220, 220),
                BackgroundColor = Color3.fromRGB(12, 12, 12),
                ElementColor    = Color3.fromRGB(20, 20, 20),
            },

            configuration = {
                autoSave = false,
                autoLoad = false,
                fileName = "BlyxoHub_StealAnEgg",
            },
        })
    end)

    if not okWin or not window then
        log.error("CreateWindow failed: %s", tostring(window))
        M.error = "Could not build the menu"
        return M
    end

    env.__BLYXO_WINDOW = window
    M.ok, M.window, M.lib = true, window, Rayfield

    BX.try("window.versionTag", function()
        local shown = tostring(BX.version or ""):match("^(%d+%.%d+)")
            or tostring(BX.version or ""):match("^(%d+)")
        if not shown then return end
        window:CreateTag({
            title = "V" .. shown,
            color = Color3.fromRGB(206, 206, 212),
        })
    end)

    local sc = BX.scope("ui.window")
    local screen = nil

    BX.try("window.resolveGui", function()
        if typeof(window.screenGui) == "Instance" and window.screenGui:IsA("ScreenGui") then
            screen = window.screenGui
        end
    end)

    if not screen then
        BX.try("window.findGui", function()
            local root = exec.hiddenParent()
            for _ = 1, 20 do
                for _, g in ipairs(root:GetChildren()) do
                    if g:IsA("ScreenGui") and g.Name ~= "BlyxoSplash"
                       and g.Name ~= "BlyxoStats" and g:FindFirstChild("Main") then
                        screen = g
                        break
                    end
                end
                if screen then break end
                task.wait(0.05)
            end
        end)
        if screen then
            log.warn("window.screenGui missing - fell back to searching for it")
        end
    end

    M.screen = screen
    if not screen then
        log.error("could not resolve the menu ScreenGui - it cannot be hidden "
            .. "during loading")
    end

    function M.hide()
        if not screen then return false end
        screen.Enabled = false
        return true
    end

    function M.reveal()
        if not screen or not screen.Parent then return false end
        screen.Enabled = true
        return true
    end

    function M.isVisible()
        return screen ~= nil and screen.Parent ~= nil and screen.Enabled == true
    end

    function M.tab(name)
        local ok, t = BX.try("window.tab." .. name, function()
            return window:CreateTab({ name = name })
        end)
        return ok and t or nil
    end

    local hasNotify = type(Rayfield.Notify) == "function"
    if not hasNotify then
        log.warn("this Rayfield build has no Notify - messages go to the log only")
    end

    function M.notify(title, content, duration)
        if not hasNotify then
            log.info("[notify] %s: %s", tostring(title or "BlyxoHub"), tostring(content or ""))
            return false
        end
        return (BX.try("window.notify", function()
            Rayfield:Notify({
                title = title or "BlyxoHub",
                content = content or "",
                duration = duration or 4,
            })
        end))
    end

    M.hasNotify = hasNotify

    function M.unload()
        BX.try("window.unload", function()
            if window and not window.unloaded then window:Unload() end
        end)
        sc:destroy()
    end

    log.info("menu built")
    return M
end)

BX.module("features.movement", function(BX)
    local svc = BX.require("core.services")
    local ch  = BX.require("core.character")
    local dev = BX.require("core.device")
    local rs  = BX.require("core.restore")
    local log = BX.require("boot.log").for_module("movement")

    local RunService, Players = svc.RunService, svc.Players
    local M = {}

    local K = {
        GROUND_OFFSET     = 3,
        CRUISE_UP         = 18,    
        RAMP_FRAC         = 0.12,  
        RAMP_MAX          = 220,
        RAMP_MIN          = 40,    
        START_SPEED       = 0.45,  
        SPEED_RAMP_FRAC   = 0.28,
        SLOW_RADIUS       = 50,    
        SLOW_SPEED        = 260,
        ARRIVE            = 5,
        MAX_DT            = 0.05,  
        MAX_FRAME         = 0.25,  
        MAX_DEBT          = 2.0,   
        MAX_STEP          = 20,    
        SPEED             = 1200,  
        SPEED_NOSPOOF     = 500,   
        NOSPOOF_FLOOR     = 300,
        NOSPOOF_CONVERGE  = 40,
        DROP_SPEED        = 400,
        SPOOF_HEADROOM    = 1.35,  
        WS_MAX            = 4000,
        WALKSPEED_SANE_MIN = 40,
        RELOC_CLAMP_FOR   = 6,
        RELOC_CLAMP_RATIO = 1.04,

        TP_SETTLE         = 0.35,
        TP_LANDED         = 30,
    }
    M.K = K

    local ac = nil
    function M.setAnticheat(adapter) ac = adapter end
    local function acGet(name)
        local f = ac and ac[name]
        return type(f) == "function" and f or nil
    end

    local groundParams = RaycastParams.new()
    groundParams.FilterType = Enum.RaycastFilterType.Exclude
    groundParams.IgnoreWater = true

    local filterDirty = true
    local scratchIgnore = {}   

    local function rebuildFilter()

        local n = 0
        for i = #scratchIgnore, 1, -1 do scratchIgnore[i] = nil end
        for _, pl in ipairs(Players:GetPlayers()) do
            if pl.Character then
                n = n + 1
                scratchIgnore[n] = pl.Character
            end
        end
        groundParams.FilterDescendantsInstances = scratchIgnore
        filterDirty = false
    end

    local function solidGroundY(pos)
        if filterDirty then rebuildFilter() end
        local origin = pos + Vector3.new(0, 80, 0)
        local dir = Vector3.new(0, -700, 0)

        local extra = nil
        for _ = 1, 15 do
            local r = workspace:Raycast(origin, dir, groundParams)
            if not r then break end
            if r.Instance.CanCollide then
                if extra then groundParams.FilterDescendantsInstances = scratchIgnore end
                return r.Position.Y + K.GROUND_OFFSET
            end

            extra = extra or table.clone(scratchIgnore)
            extra[#extra + 1] = r.Instance
            groundParams.FilterDescendantsInstances = extra
        end
        if extra then groundParams.FilterDescendantsInstances = scratchIgnore end
        return nil
    end

    local function groundOr(pos, fallback)
        return solidGroundY(pos) or fallback
    end

    M.groundY = solidGroundY

    local noclipSc, noclipWas, noclipParts, noclipFor = nil, nil, nil, nil

    local function noclipStep()
        local char = ch.get()
        if not char then return end
        if noclipFor ~= char or not noclipParts then

            noclipParts, noclipFor, noclipWas = {}, char, {}
            for _, p in ipairs(char:GetDescendants()) do
                if p:IsA("BasePart") then
                    noclipParts[#noclipParts + 1] = p
                    noclipWas[p] = p.CanCollide
                end
            end
        end
        for i = 1, #noclipParts do
            local p = noclipParts[i]
            if p.Parent and p.CanCollide then p.CanCollide = false end
        end
    end

    function M.noclip(on)
        if on then
            if noclipSc then return end

            rs.onRestore("movement.noclip", function() M.noclip(false) end)
            noclipSc = BX.scope("features.movement.noclip")
            noclipSc:onFrame("noclip", RunService.Stepped, noclipStep)
        else
            if not noclipSc then return end
            noclipSc:destroy()
            noclipSc = nil

            if noclipWas then
                for part, was in pairs(noclipWas) do
                    if part.Parent then pcall(function() part.CanCollide = was end) end
                end
            end
            noclipParts, noclipWas, noclipFor = nil, nil, nil
        end
    end

    local brk = { low = nil, high = nil, speed = nil, legSpeed = nil, legRelocs = nil }

    function M.outboundSpeed()
        return K.SPEED
    end

    function M.carrySpeedCap()
        if not acGet("relocateCount") then return K.SPEED_NOSPOOF end
        return brk.speed or K.SPEED_NOSPOOF
    end

    local function bracketAfterLeg()
        local count = acGet("relocateCount")
        if not count or not brk.legSpeed then return end

        local used = brk.legSpeed
        local hadRelocs = count() > (brk.legRelocs or 0)

        if hadRelocs then
            brk.high = used                                   
        else
            brk.low = math.max(brk.low or K.SPEED_NOSPOOF, used)
        end

        local low = brk.low or K.SPEED_NOSPOOF
        local nextSpeed
        if brk.high then
            if (brk.high - low) <= K.NOSPOOF_CONVERGE then
                nextSpeed = low                               
            else
                nextSpeed = math.floor((low + brk.high) / 2)
            end
        else
            nextSpeed = math.min(K.SPEED, low * 2)
        end

        nextSpeed = math.clamp(nextSpeed, K.NOSPOOF_FLOOR, K.SPEED)
        if nextSpeed ~= (brk.speed or K.SPEED_NOSPOOF) then
            log.info("travel: %s at %d - next leg %d studs/s (bracket %d..%s)",
                hadRelocs and "relocated" or "clean", used, nextSpeed,
                low, tostring(brk.high or "-"))
        end
        brk.speed = nextSpeed
        brk.legSpeed = nil
    end

    local stats = { legs = 0, cancelled = 0, respawned = 0, timedOut = 0, arrived = 0,
                    teleports = 0, tpLanded = 0, tpRefused = 0 }
    function M.stats() return table.clone(stats) end

    function M.teleport(pos, tag)
        local char, hrp = ch.get(), ch.root()
        if not char or not hrp then return false, math.huge end

        local gy = solidGroundY(pos)
        local dest = Vector3.new(pos.X, gy or pos.Y, pos.Z)
        local from = hrp.Position

        local ok = pcall(function() char:PivotTo(CFrame.new(dest)) end)
        if ok then
            hrp.AssemblyLinearVelocity = Vector3.zero
            hrp.AssemblyAngularVelocity = Vector3.zero
        end

        task.wait(dev.scale(K.TP_SETTLE))

        local h2 = ch.root()
        local gap = h2 and (h2.Position - dest).Magnitude or math.huge
        local landed = gap <= K.TP_LANDED

        stats.teleports = stats.teleports + 1
        if landed then
            stats.tpLanded = stats.tpLanded + 1
        else
            stats.tpRefused = stats.tpRefused + 1
        end

        log.info("tp %s: %.0f studs -> %s (%.0f off, tier=%s)",
            tostring(tag), (dest - from).Magnitude,
            landed and "landed" or "REFUSED", gap, dev.tier)

        return landed, gap
    end

    local function writeStep(char, hum, hrp, dest, look)
        if hum then hum:Move(Vector3.zero, false) end
        char:PivotTo(CFrame.lookAt(dest, dest + look))
        hrp.AssemblyLinearVelocity = Vector3.zero
        hrp.AssemblyAngularVelocity = Vector3.zero
    end

    function M.travel(opts)
        local pos      = opts.to
        local tag      = opts.tag or "leg"
        local arrive   = opts.arrive or K.ARRIVE
        local carrying = opts.carrying and true or false
        local cancel   = opts.cancel

        local char = ch.get()
        local hrp  = ch.root()
        local hum  = ch.humanoid()
        if not char or not hrp then
            log.warn("%s: no character to move", tag)
            return false, { reason = "no-character" }
        end

        local speed = math.max(opts.speed or K.SPEED_NOSPOOF, 40)

        local start = hrp.Position
        local flatTotal = Vector3.new(pos.X - start.X, 0, pos.Z - start.Z).Magnitude
        if flatTotal < 1 then return true, { reason = "already-there", distance = 0 } end

        local startGround = groundOr(start, start.Y)
        local endGround   = groundOr(pos, pos.Y)
        local landY   = endGround
        local cruiseY = math.max(startGround, endGround, start.Y, pos.Y) + K.CRUISE_UP

        local ramp = math.clamp(flatTotal * K.RAMP_FRAC, K.RAMP_MIN, K.RAMP_MAX)
        if ramp * 2 > flatTotal * 0.9 then ramp = flatTotal * 0.45 end
        if flatTotal < K.RAMP_MIN * 2 then cruiseY = math.max(start.Y, pos.Y) end

        local wasPS = hum and hum.PlatformStand or false
        if hum then

            rs.remember("movement.platformStand",
                function() return hum.PlatformStand end,
                function(v) hum.PlatformStand = v end)
            hum.PlatformStand = true
        end

        local push, spoofFn = acGet("push"), acGet("spoof")
        local spoof = (not carrying) and hum and true or false
        local claimWS, savedWS = nil, nil
        if spoof then
            rs.remember("movement.walkSpeed",
                function() return hum.WalkSpeed end,
                function(v) hum.WalkSpeed = v end)
            savedWS = hum.WalkSpeed
            claimWS = math.clamp(speed * K.SPOOF_HEADROOM, 16, K.WS_MAX)
            hum.WalkSpeed = claimWS
        end

        if not carrying and not spoof then
            brk.legSpeed = speed
            local count = acGet("relocateCount")
            brk.legRelocs = count and count() or 0
        end

        local legAt = os.clock()
        local t0 = legAt
        local deadline = t0 + math.max(flatTotal / speed, 0.3) * 3 + 6
        local lastT = t0
        local arcDebt = 0
        local ok, reason = false, "timeout"
        local frames, subStepTotal, maxFrameSeen = 0, 0, 0

        log.trace("%s: begin %.0f studs at %.0f studs/s (carrying=%s spoof=%s tier=%s)",
            tag, flatTotal, speed, tostring(carrying), tostring(spoof), dev.tier)

        while os.clock() < deadline do
            if cancel and cancel() then reason = "cancelled" break end

            local liveChar = ch.get()
            if liveChar ~= char then
                reason = "respawned"
                break
            end
            local hh = ch.root()
            if not hh then reason = "lost-root" break end

            local now = os.clock()
            local raw = now - lastT
            lastT = now

            arcDebt = math.min(arcDebt + raw, K.MAX_DEBT)
            local frameDt = math.min(arcDebt, K.MAX_FRAME)
            arcDebt = arcDebt - frameDt
            if raw > maxFrameSeen then maxFrameSeen = raw end

            local subSteps = math.max(1, math.ceil(frameDt / K.MAX_DT))
            local dt = frameDt / subSteps
            frames = frames + 1
            subStepTotal = subStepTotal + subSteps

            local flat = Vector3.new(pos.X - hh.Position.X, 0, pos.Z - hh.Position.Z)
            local rem = flat.Magnitude
            if rem <= arrive then ok, reason = true, "arrived" break end

            local done = math.max(flatTotal - rem, 0)

            local want
            local speedRamp = math.max(ramp * K.SPEED_RAMP_FRAC, 1)
            if rem <= K.SLOW_RADIUS then
                want = math.min(K.SLOW_SPEED, speed)
            elseif rem < ramp then
                local f = rem / ramp
                want = math.max(speed * f, math.min(K.SLOW_SPEED, speed))
            elseif done < speedRamp then
                want = speed * (K.START_SPEED + (1 - K.START_SPEED) * (done / speedRamp))
            else
                want = speed
            end

            local lastReloc = acGet("lastRelocateAt")
            local relocAt = lastReloc and lastReloc() or nil
            if relocAt and (not carrying or relocAt >= legAt)
               and (os.clock() - relocAt) < K.RELOC_CLAMP_FOR then
                local allowFn = acGet("allowance")
                local allow = allowFn and allowFn() or nil
                if not allow and hum and hum.WalkSpeed > K.WALKSPEED_SANE_MIN then
                    allow = hum.WalkSpeed * K.RELOC_CLAMP_RATIO
                end
                if allow and allow > 0 and want > allow then
                    want = allow
                end
            end

            local wantY
            if done < ramp then
                wantY = start.Y + (cruiseY - start.Y) * (done / ramp)
            elseif rem < ramp then
                wantY = landY + (cruiseY - landY) * (rem / ramp)
            else
                wantY = cruiseY
            end

            local arrived = false
            for _ = 1, subSteps do
                local hp = hh.Position
                local f2 = Vector3.new(pos.X - hp.X, 0, pos.Z - hp.Z)
                local rem2 = f2.Magnitude
                if rem2 <= arrive then arrived = true break end

                local step = math.min(rem2, want * dt, K.MAX_STEP)
                local unit = f2.Unit
                local nxt = hp + unit * step
                pcall(writeStep, char, hum, hh,
                    Vector3.new(nxt.X, wantY, nxt.Z), unit)
            end
            if arrived then ok, reason = true, "arrived" break end

            if spoof then

                if hum.WalkSpeed < claimWS - 1 then hum.WalkSpeed = claimWS end

                if push or spoofFn then
                    local told = flat.Unit * math.min(want, claimWS)
                    if push then push(hh, hum, told) else spoofFn(claimWS, told) end
                end
                pcall(function() hh.AssemblyLinearVelocity = Vector3.zero end)
            end

            RunService.Heartbeat:Wait()
        end

        local hz = ch.root()
        local liveChar = ch.get()
        if hz and liveChar == char then
            local gy = solidGroundY(hz.Position)
            if gy and math.abs(hz.Position.Y - gy) > 1 then
                pcall(function() char:PivotTo(CFrame.new(hz.Position.X, gy, hz.Position.Z)) end)
            end
        end

        if spoof and hum and hum.Parent then

            local legalFn = acGet("legalWalkSpeed")
            local legal = legalFn and legalFn() or savedWS or 16
            pcall(function() hum.WalkSpeed = math.max(legal, 16) end)
        end
        if hum and hum.Parent then
            hum.PlatformStand = wasPS
            local hstate = hum:GetState()
            if hstate == Enum.HumanoidStateType.Freefall
               or hstate == Enum.HumanoidStateType.PlatformStanding
               or hstate == Enum.HumanoidStateType.Physics then
                pcall(function() hum:ChangeState(Enum.HumanoidStateType.Landed) end)
            end
        end
        if hz then
            hz.AssemblyLinearVelocity = Vector3.zero
            hz.AssemblyAngularVelocity = Vector3.zero
        end

        if not carrying and not spoof then bracketAfterLeg() end

        local gap = hz and Vector3.new(pos.X - hz.Position.X, 0, pos.Z - hz.Position.Z).Magnitude
            or math.huge
        local elapsed = os.clock() - t0
        local settled = ok or gap <= arrive + 4

        stats.legs = stats.legs + 1
        stats[settled and "arrived" or (reason == "cancelled" and "cancelled")
            or (reason == "respawned" and "respawned") or "timedOut"] =
            (stats[settled and "arrived" or (reason == "cancelled" and "cancelled")
            or (reason == "respawned" and "respawned") or "timedOut"] or 0) + 1

        local level = settled and log.trace or log.warn
        level("%s: %s %.0f studs in %.2fs (want %.0f/s, %.0f/s actual, %.1f short) "
            .. "reason=%s frames=%d sub=%.1f worstFrame=%.0fms tier=%s",
            tag, settled and "ok" or "FAILED", flatTotal, elapsed, speed,
            flatTotal / math.max(elapsed, 0.001), gap, reason, frames,
            frames > 0 and (subStepTotal / frames) or 0,
            maxFrameSeen * 1000, dev.tier)

        return settled, {
            reason = reason, distance = flatTotal, elapsed = elapsed,
            gap = gap, frames = frames, worstFrameMs = maxFrameSeen * 1000,
        }
    end

    function M.descend(tag)
        tag = tag or "land"
        local char, h = ch.get(), ch.root()
        if not char or not h then return false end
        local hum = ch.humanoid()

        local gy = solidGroundY(h.Position)
        if not gy then
            
            if hum then hum.PlatformStand = false end
            log.trace("%s: no ground below - falling", tag)
            return false
        end

        local x, z = h.Position.X, h.Position.Z
        local from = h.Position.Y
        if from - gy <= 2 then
            if hum then hum.PlatformStand = false end
            return true
        end

        if hum then hum.PlatformStand = true end
        local t0 = os.clock()
        local dur = math.clamp((from - gy) / math.max(K.DROP_SPEED, 50), 0.05, 1.2)
        while os.clock() - t0 < dur do
            if ch.get() ~= char then break end
            local hh = ch.root()
            if not hh then break end
            local f = (os.clock() - t0) / dur
            local y = from + (gy - from) * f
            pcall(function()
                char:PivotTo(CFrame.new(x, y, z) * (hh.CFrame - hh.CFrame.Position))
                hh.AssemblyLinearVelocity = Vector3.zero
            end)
            RunService.Heartbeat:Wait()
        end

        if ch.get() == char then
            pcall(function() char:PivotTo(CFrame.new(x, gy, z)) end)
        end
        if hum and hum.Parent then
            hum.PlatformStand = false
            pcall(function() hum:ChangeState(Enum.HumanoidStateType.Landed) end)
        end
        log.trace("%s: descended %.0f studs to ground", tag, from - gy)
        return true
    end

    local sc = BX.scope("features.movement")
    sc:connect(Players.PlayerAdded, function() filterDirty = true end)
    sc:connect(Players.PlayerRemoving, function() filterDirty = true end)
    ch.onSpawn(sc, "movement.respawn", function()
        filterDirty = true

        noclipParts, noclipWas, noclipFor = nil, nil, nil
    end)

    function M.reset()
        M.noclip(false)
    end

    return M
    function M.setSpeed(v)
        v = math.clamp(tonumber(v) or K.SPEED, 40, 1000)
        K.SPEED = v
        return v
    end

end)

BX.module("features.humanoid", function(BX)
    local svc = BX.require("core.services")
    local ch  = BX.require("core.character")
    local rs  = BX.require("core.restore")
    local log = BX.require("boot.log").for_module("humanoid")

    local M = {}

    local SWAP_ATTR = "BlyxoStealHum"
    M.SWAP_ATTR = SWAP_ATTR

    local sc = nil

    local swapPrior = nil
    local stats = { swaps = 0, alreadySwapped = 0, failures = 0 }
    function M.stats() return table.clone(stats) end

    function M.isSwapped()
        local hum = ch.humanoid()
        return hum ~= nil and hum:GetAttribute(SWAP_ATTR) == true
    end

    local function applyStates(prior)
        local hum = ch.humanoid()
        if not hum or hum:GetAttribute(SWAP_ATTR) ~= true then return end
        hum:SetStateEnabled(Enum.HumanoidStateType.Dead, prior.dead)
        hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, prior.fallingDown)
        hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, prior.ragdoll)
        hum.BreakJointsOnDeath = prior.breakJoints
    end

    local function rememberStates(prior)

        rs.remember("humanoid.states",
            function() return prior end,
            function(v) applyStates(v) end)
    end

    function M.swap(char)
        char = char or ch.get()
        if not char then return false end

        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return false end

        if hum:GetAttribute(SWAP_ATTR) == true then
            stats.alreadySwapped = stats.alreadySwapped + 1
            return true
        end

        local prior = {
            dead        = hum:GetStateEnabled(Enum.HumanoidStateType.Dead),
            fallingDown = hum:GetStateEnabled(Enum.HumanoidStateType.FallingDown),
            ragdoll     = hum:GetStateEnabled(Enum.HumanoidStateType.Ragdoll),
            breakJoints = hum.BreakJointsOnDeath,
        }

        local ok = BX.try("humanoid.swap", function()

            local healthScript = char:FindFirstChild("Health")
            if healthScript then healthScript:Destroy() end

            hum.BreakJointsOnDeath = false
            hum.Archivable = true

            local clone = hum:Clone()
            if not clone then error("clone failed") end
            clone.Name = "Humanoid"
            clone:SetAttribute(SWAP_ATTR, true)
            clone:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
            clone:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            clone:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            clone.Health = hum.MaxHealth

            if not clone:FindFirstChildOfClass("Animator") then
                Instance.new("Animator").Parent = clone
            end

            hum:Destroy()
            clone.Parent = char

            if workspace.CurrentCamera then
                workspace.CurrentCamera.CameraSubject = clone
            end

            local animate = char:FindFirstChild("Animate")
            if animate then
                local ac = animate:Clone()
                animate:Destroy()
                ac.Parent = char
                ac.Disabled = false
            end

            for _, d in ipairs(char:GetDescendants()) do
                if d:IsA("Motor6D") then d.Enabled = true end
            end
        end)

        if ok then

            rs.permanent("humanoid.swap",
                "Humanoid replaced and Health script destroyed - undone by respawn")

            swapPrior = prior
            rememberStates(prior)
            stats.swaps = stats.swaps + 1
            log.info("swapped (anticheat now holds a destroyed Humanoid)")
        else
            stats.failures = stats.failures + 1
            log.error("swap FAILED - teleports will be punished")
        end
        return ok and true or false
    end

    function M.isArmed() return sc ~= nil end

    function M.arm()
        if sc then return true end
        sc = BX.scope("features.humanoid")

        M.swap()

        ch.onSpawn(sc, "humanoid.reswap", function(char)

            swapPrior = nil
            M.swap(char)
        end)

        return true
    end

    function M.disarm()

        if swapPrior then
            BX.try("humanoid.restoreStates", function()
                applyStates(swapPrior)
                log.info("death states restored (dead=%s fallingDown=%s "
                    .. "ragdoll=%s breakJoints=%s) - the character can respawn "
                    .. "normally again",
                    tostring(swapPrior.dead), tostring(swapPrior.fallingDown),
                    tostring(swapPrior.ragdoll), tostring(swapPrior.breakJoints))
            end)
        end

        if not sc then return end
        sc:destroy()
        sc = nil
        log.info("disarmed (%d swaps this session)", stats.swaps)
    end

    return M
end)

BX.module("features.jump", function(BX)
    local svc  = BX.require("core.services")
    local ch   = BX.require("core.character")
    local st   = BX.require("core.state")
    local hsw  = BX.require("features.humanoid")
    local log  = BX.require("boot.log").for_module("jump")

    local M = {}

    local sc = nil
    local stats = { requests = 0, applied = 0, duringRun = 0, unswapped = 0, busy = 0 }
    function M.stats() return table.clone(stats) end

    function M.isArmed() return sc ~= nil end

    function M.arm()
        if sc then return true end
        sc = BX.scope("features.jump")

        sc:connect(svc.UserInputService.JumpRequest, function()
            stats.requests = stats.requests + 1

            if st.autoStealOn then
                stats.duringRun = stats.duringRun + 1
                return
            end

            local hum = ch.humanoid()
            if not hum then return end

            if hum:GetAttribute(hsw.SWAP_ATTR) ~= true then
                stats.unswapped = stats.unswapped + 1
                return
            end

            if hum.Health <= 0 then return end

            local state = hum:GetState()
            if state == Enum.HumanoidStateType.Jumping
               or state == Enum.HumanoidStateType.Freefall then
                stats.busy = stats.busy + 1
                return
            end

            hum.Jump = true
            stats.applied = stats.applied + 1
        end)

        log.info("armed - the player's jump reaches the live humanoid")
        return true
    end

    function M.disarm()
        if not sc then return end
        sc:destroy()
        sc = nil

        log.info("disarmed (%d requests, %d applied)", stats.requests, stats.applied)
    end

    return M
end)

BX.module("features.antideath", function(BX)
    local ch  = BX.require("core.character")
    local svc = BX.require("core.services")
    local rs  = BX.require("core.restore")
    local log = BX.require("boot.log").for_module("antideath")

    local M = {}

    local sc = nil
    local saved = nil        
    local armedFor = nil     

    local stats = { arms = 0, deathsBlocked = 0, restores = 0 }
    function M.stats() return table.clone(stats) end

    local function applyTo(char)
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not hum then return false end
        if armedFor == hum then return true end

        saved = {
            humanoid = hum,
            breakJoints = hum.BreakJointsOnDeath,
            deadEnabled = hum:GetStateEnabled(Enum.HumanoidStateType.Dead),
        }
        armedFor = hum

        BX.try("antideath.apply", function()
            rs.remember("antideath.breakJoints",
                function() return hum.BreakJointsOnDeath end,
                function(v) hum.BreakJointsOnDeath = v end)
            rs.remember("antideath.state.Dead",
                function() return hum:GetStateEnabled(Enum.HumanoidStateType.Dead) end,
                function(v) hum:SetStateEnabled(Enum.HumanoidStateType.Dead, v) end)
            hum.BreakJointsOnDeath = false
            hum:SetStateEnabled(Enum.HumanoidStateType.Dead, false)
        end)

        sc:connect(hum.HealthChanged, function(hp)
            if hp <= 0 and hum.Parent then
                stats.deathsBlocked = stats.deathsBlocked + 1
                hum.Health = hum.MaxHealth
            end
        end)

        sc:connect(hum.StateChanged, function(_, new)
            if new == Enum.HumanoidStateType.Dead and hum.Parent then
                stats.deathsBlocked = stats.deathsBlocked + 1
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
                hum.Health = hum.MaxHealth
            end
        end)

        if hum.Health <= 0 then
            stats.deathsBlocked = stats.deathsBlocked + 1
            log.warn("armed on a humanoid already at 0 health - reviving it")
            hum.Health = hum.MaxHealth
        end

        stats.arms = stats.arms + 1
        log.trace("armed on humanoid (health %.0f/%.0f)", hum.Health, hum.MaxHealth)
        return true
    end

    local function restore()
        local s = saved
        saved, armedFor = nil, nil
        if not s or not s.humanoid or not s.humanoid.Parent then return end
        stats.restores = stats.restores + 1
        BX.try("antideath.restore", function()
            s.humanoid.BreakJointsOnDeath = s.breakJoints
            s.humanoid:SetStateEnabled(Enum.HumanoidStateType.Dead, s.deadEnabled)
        end)
    end

    function M.isArmed() return sc ~= nil end

    function M.arm()
        if sc then return true end
        sc = BX.scope("features.antideath")

        local ok = applyTo(ch.get())

        ch.onSpawn(sc, "antideath.rearm", function(char)

            saved, armedFor = nil, nil
            applyTo(char)
        end)

        log.info("armed (%s)", ok and "ok" or "no humanoid yet")
        return true
    end

    function M.disarm()
        if not sc then return end
        sc:destroy()
        sc = nil

        BX.try("antideath.reviveOnDisarm", function()
            local hum = ch.humanoid()
            if hum and hum.Parent and hum.Health <= 0 then
                log.warn("disarming on 0 health - reviving before restoring states")
                hum.Health = hum.MaxHealth
            end
        end)

        restore()
        log.info("disarmed (blocked %d deaths this session)", stats.deathsBlocked)
    end

    return M
end)

BX.module("features.guard", function(BX)
    local svc = BX.require("core.services")
    local data = BX.require("core.data")
    local ch  = BX.require("core.character")
    local rs  = BX.require("core.restore")
    local log = BX.require("boot.log").for_module("guard")

    local RunService = svc.RunService
    local M = {}

    local K = {
        RISE      = 150,   
        FLAT_MULT = 2.5,   
        FLAT_MIN  = 150,   
        JOINT_GAP = 0.25,  
        HOLD_MAX  = 2.75,  
        HOLD_GRACE = 0.25, 
    }
    M.K = K

    local sc = nil
    local stats = { launchesCancelled = 0, standUps = 0, dropsRefused = 0 }
    function M.stats() return table.clone(stats) end

    function M.isRagdolled()
        local hum = ch.humanoid()
        if not hum then return false end
        if hum.PlatformStand then return true end
        local s = hum:GetState()
        return s == Enum.HumanoidStateType.Physics
            or s == Enum.HumanoidStateType.Ragdoll
            or s == Enum.HumanoidStateType.FallingDown
    end

    function M.waitForRecovery(seconds)
        local deadline = os.clock() + (seconds or 4)
        while os.clock() < deadline do
            if not M.isRagdolled() then return true end
            RunService.Heartbeat:Wait()
        end
        return false
    end

    local function applyAntiRagdoll(char)
        char = char or ch.get()
        local hum = char and char:FindFirstChildOfClass("Humanoid")
        if not hum then return false end
        BX.try("guard.antiRagdoll", function()

            rs.remember("guard.state.Ragdoll",
                function() return hum:GetStateEnabled(Enum.HumanoidStateType.Ragdoll) end,
                function(v) hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, v) end)
            rs.remember("guard.state.FallingDown",
                function() return hum:GetStateEnabled(Enum.HumanoidStateType.FallingDown) end,
                function(v) hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, v) end)
            hum:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
            hum:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
            for _, d in ipairs(char:GetDescendants()) do
                if d:IsA("Motor6D") then d.Enabled = true end
            end
        end)
        return true
    end

    local dropOriginal, dropInstalled, eggStateRef = nil, false, nil
    local dropAllowed = false

    local function installDropBlock()
        if dropInstalled then return true end
        eggStateRef = eggStateRef or data.eggState()
        if not eggStateRef or type(eggStateRef.DropFieldEgg) ~= "function" then
            log.warn("cannot block egg drops - EggState.DropFieldEgg missing")
            return false
        end

        dropOriginal = eggStateRef.DropFieldEgg
        eggStateRef.DropFieldEgg = function(reason, ...)
            if not dropAllowed then
                stats.dropsRefused = stats.dropsRefused + 1
                log.trace("drop refused: %s", tostring(reason))
                return
            end
            return dropOriginal(reason, ...)
        end
        dropInstalled = true
        log.info("egg-drop block installed")
        return true
    end

    local function removeDropBlock()
        if not dropInstalled then return end
        BX.try("guard.restoreDrop", function()
            if eggStateRef and dropOriginal then
                eggStateRef.DropFieldEgg = dropOriginal
            end
        end)
        dropInstalled, dropOriginal = false, nil
    end

    function M.allowDrops(on) dropAllowed = on and true or false end

    local blocked, ups, jointAt = 0, 0, 0

    local function antiHitStep()
        local hum, hrp = ch.humanoid(), ch.root()
        if not hum or not hrp then return end

        local st = hum:GetState()
        
        if st == Enum.HumanoidStateType.Jumping then return end

        local v = hrp.AssemblyLinearVelocity
        local flat = (v * Vector3.new(1, 0, 1)).Magnitude
        local flatCap = math.max((hum.WalkSpeed or 16) * K.FLAT_MULT, K.FLAT_MIN)
        if v.Y > K.RISE or flat > flatCap then
            local keep = Vector3.zero
            if flat > 0.001 then
                keep = (v * Vector3.new(1, 0, 1)).Unit * math.min(flat, hum.WalkSpeed or 16)
            end
            hrp.AssemblyLinearVelocity = Vector3.new(keep.X, math.min(v.Y, 0), keep.Z)
            hrp.AssemblyAngularVelocity = Vector3.zero
            blocked = blocked + 1
            stats.launchesCancelled = blocked
        end

        if hum.PlatformStand or hum.Sit
           or st == Enum.HumanoidStateType.Physics
           or st == Enum.HumanoidStateType.Ragdoll
           or st == Enum.HumanoidStateType.FallingDown
           or st == Enum.HumanoidStateType.PlatformStanding then
            pcall(function()
                hum.PlatformStand = false
                hum.Sit = false
                hum:ChangeState(Enum.HumanoidStateType.GettingUp)
            end)
            ups = ups + 1
            stats.standUps = ups

            local now = os.clock()
            if now - jointAt > K.JOINT_GAP then
                jointAt = now
                local char = ch.get()
                if char then
                    for _, d in ipairs(char:GetDescendants()) do
                        if d:IsA("Motor6D") and not d.Enabled then d.Enabled = true end
                    end
                end
            end
        end
    end

    function M.ragdollRemaining()
        local left = 0
        BX.try("guard.ragdollRemaining", function()
            local plr = svc.LocalPlayer
            local t = plr and plr:GetAttribute("RagdollEndTime")
            if type(t) == "number" then
                left = math.max(left, t - workspace:GetServerTimeNow())
            end
        end)
        return math.max(0, left)
    end

    function M.waitForServerRelease(cancel)
        local held = M.ragdollRemaining()
        if held <= 0 then return 0 end

        local t0 = os.clock()
        local deadline = os.clock() + math.min(held, K.HOLD_MAX)
        while os.clock() < deadline do
            if cancel and cancel() then break end
            task.wait(0.05)
            if M.ragdollRemaining() <= 0 then break end
        end
        task.wait(K.HOLD_GRACE)
        local waited = os.clock() - t0
        log.trace("server held us %.2fs - waited %.2fs", held, waited)
        return waited
    end

    function M.isArmed() return sc ~= nil end

    function M.arm()
        if sc then return true end
        sc = BX.scope("features.guard")
        blocked, ups, jointAt = 0, 0, 0
        dropAllowed = false

        applyAntiRagdoll()
        installDropBlock()

        sc:onFrame("antihit", RunService.Heartbeat, antiHitStep)

        ch.onSpawn(sc, "guard.respawn", function(char)
            applyAntiRagdoll(char)
        end)

        log.info("armed (anti-hit + anti-ragdoll + drop block)")
        return true
    end

    function M.disarm()
        if not sc then return end
        sc:destroy()
        sc = nil
        dropAllowed = true
        removeDropBlock()
        log.info("disarmed (%d launches cancelled, %d stand-ups, %d drops refused)",
            stats.launchesCancelled, stats.standUps, stats.dropsRefused)
    end

    return M
end)

BX.module("features.treadmill", function(BX)
    local svc = BX.require("core.services")
    local data = BX.require("core.data")
    local ch  = BX.require("core.character")
    local dev = BX.require("core.device")
    local net = BX.require("core.net")
    local st  = BX.require("core.state")
    local log = BX.require("boot.log").for_module("treadmill")

    local M = {}

    local K = {
        PAD       = 6,     
        Y_SLACK   = 12,
        POLL      = 1.5,   
        AFTER_OFF = 2.0,   
        PART_TTL  = 30,    
    }
    M.K = K

    local PlotState = data.plotState()

    local netCall = net.call
    M.netCall = netCall

    local partCache, partAt = nil, 0

    local function treadmillPart()
        local now = os.clock()
        if partCache and partCache.Parent and (now - partAt) < K.PART_TTL then
            return partCache
        end
        local found = nil
        BX.try("treadmill.resolvePart", function()
            local plot = PlotState and PlotState.ResolvePlot and PlotState.ResolvePlot()
            if type(plot) ~= "table" or not plot.PlotFolder then return end
            local p = plot.PlotFolder:FindFirstChild("TreadmillBottom", true)
            if p and p:IsA("BasePart") then found = p end
        end)
        partCache, partAt = found, now
        return found
    end

    function M.onBelt()
        local part = treadmillPart()
        local hrp = ch.root()
        if not part or not hrp then return false end
        local rel = part.CFrame:PointToObjectSpace(hrp.Position)
        local half = part.Size * 0.5
        return math.abs(rel.X) <= half.X + K.PAD
           and math.abs(rel.Z) <= half.Z + K.PAD
           and math.abs(rel.Y) <= K.Y_SLACK
    end

    local enabled = true     
    local sc = nil
    local stats = { checks = 0, caught = 0, doffed = 0, refused = 0, yielded = 0 }
    function M.stats() return table.clone(stats) end
    function M.isOn() return enabled end

    local function step()
        if not enabled then return end

        if st.stayOnTreadmill then
            stats.yielded = stats.yielded + 1
            return
        end

        stats.checks = stats.checks + 1
        if not M.onBelt() then return end

        stats.caught = stats.caught + 1
        local ok, msg = netCall("RF/Treadmill/AskDoff")
        if ok == true then
            stats.doffed = stats.doffed + 1
            log.info("standing on the belt - AskDoff accepted")
        else
            stats.refused = stats.refused + 1
            log.warn("standing on the belt - AskDoff refused: %s %s",
                tostring(ok), tostring(msg or ""))
        end

        task.wait(dev.scale(K.AFTER_OFF))
    end

    function M.arm()
        if sc then return true end
        sc = BX.scope("features.treadmill")

        sc:loop("watch", dev.scale(K.POLL), step)

        ch.onSpawn(sc, "treadmill.respawn", function()
            partCache, partAt = nil, 0
        end)

        log.info("armed (poll %.1fs, %s)", dev.scale(K.POLL),
            enabled and "enabled" or "disabled")
        return true
    end

    function M.disarm()
        if not sc then return end
        sc:destroy()
        sc = nil
        partCache, partAt = nil, 0
        
        log.info("disarmed (%d checks, %d caught, %d doffed)",
            stats.checks, stats.caught, stats.doffed)
    end

    function M.setEnabled(on)
        enabled = on and true or false
        log.info("anti treadmill %s", enabled and "ON" or "OFF")
        if enabled then M.arm() end
    end

    return M
end)

BX.module("features.farm.filter", function(BX)
    local data = BX.require("core.data")
    local eggs = BX.require("features.eggs")
    local log  = BX.require("boot.log").for_module("farm.filter")

    local M = {}

    local function AreasDir() return data.areasDir() end
    local function AssetsDir() return data.assetsDir() end

    local areas    = {}          
    local rarities = {}          
    local targetBy = "Income"    

    local function count(set)
        local n = 0
        for _ in pairs(set) do n = n + 1 end
        return n
    end

    local function toSet(list)
        local set = {}
        if type(list) == "table" then
            for _, v in pairs(list) do
                if v ~= nil and v ~= "" then set[tostring(v)] = true end
            end
        elseif type(list) == "string" and list ~= "" then
            set[list] = true
        end
        return set
    end

    function M.areaOptions()
        local out = {}
        for id, entry in pairs(AreasDir() or {}) do
            out[#out + 1] = {
                id = tostring(id),
                label = tostring((type(entry) == "table" and entry.DisplayName) or id),
            }
        end
        table.sort(out, function(a, b) return a.label < b.label end)
        return out
    end

    function M.rarityOptions()
        local seen, rows = {}, {}
        for _, entry in pairs(AssetsDir() or {}) do
            local r = type(entry) == "table" and entry.Rarity or nil
            if type(r) == "table" then
                local id = tostring(r._id or r.DisplayName or "")
                if id ~= "" and not seen[id] then
                    seen[id] = true
                    rows[#rows + 1] = {
                        id = id,
                        label = tostring(r.DisplayName or id),
                        num = tonumber(r.RarityNumber) or 0,
                    }
                end
            end
        end
        table.sort(rows, function(a, b)
            if a.num ~= b.num then return a.num < b.num end
            return a.label < b.label
        end)
        return rows
    end

    function M.targetByOptions() return { "Income", "Weight" } end

    function M.setAreas(list)
        areas = toSet(list)
        log.info("areas: %s", count(areas) == 0 and "any" or tostring(count(areas)))
    end

    function M.setRarities(list)
        rarities = toSet(list)
        log.info("rarities: %s", count(rarities) == 0 and "any" or tostring(count(rarities)))
    end

    function M.setTargetBy(v)
        targetBy = (v == "Weight") and "Weight" or "Income"
        log.info("target by: %s", targetBy)
    end

    function M.selection()
        return { areas = areas, rarities = rarities, targetBy = targetBy }
    end

    function M.describe()
        return ("%s areas, %s rarities, by %s"):format(
            count(areas) == 0 and "all" or tostring(count(areas)),
            count(rarities) == 0 and "any" or tostring(count(rarities)),
            targetBy)
    end

    local function rarityOk(e)
        if count(rarities) == 0 then return true end

        local id = tostring(e.rarityId or e.rarity or "")
        local label = tostring(e.rarity or "")
        return rarities[id] == true or rarities[label] == true
    end

    local function wanted(e)
        if count(areas) > 0 and not areas[tostring(e.areaId)] then return false end
        return rarityOk(e)
    end

    local last = { text = "waiting for the first pass", n = 0, field = 0, degraded = nil }
    function M.status() return last end

    local function degradedFor(list)
        local anyArea, anyRarity = false, false
        for _, e in ipairs(list) do
            if e.areaId ~= nil then anyArea = true end
            if e.rarity and e.rarity ~= "?" then anyRarity = true end
            if anyArea and anyRarity then return nil end
        end
        if count(areas) > 0 and not anyArea then
            return "eggs carry no area on this executor - clear the Areas filter"
        end
        if count(rarities) > 0 and not anyRarity then
            return "eggs carry no rarity on this executor - clear the Rarities filter"
        end
        return nil
    end

    function M.pick()
        local list = eggs.list()          
        local field = list and #list or 0
        if field == 0 then
            last = { text = "no takeable eggs on the field", n = 0, field = 0 }
            return nil, "field=0 (no takeable eggs listed)"
        end

        local afterArea, afterRarity = 0, 0
        local best, bestKey
        for _, e in ipairs(list) do
            local areaOk = (count(areas) == 0) or areas[tostring(e.areaId)] == true
            if areaOk then
                afterArea = afterArea + 1
                if rarityOk(e) then
                    afterRarity = afterRarity + 1
                    local key = (targetBy == "Weight") and (tonumber(e.kg) or 0)
                                                       or (tonumber(e.value) or 0)
                    if not best or key > bestKey then best, bestKey = e, key end
                end
            end
        end

        if best then
            last = { text = ("%d of %d eggs match  \u{B7}  next: %s"):format(afterRarity, field, tostring(best.name)),
                     n = afterRarity, field = field }
            return best
        end

        local degraded = degradedFor(list)
        local why = ("all eggs discovered=%d area-matched=%d rarity-matched=%d target candidates=%d final eligible=0 (%s)")
            :format(field, afterArea, afterRarity, afterRarity, M.describe())
        if degraded then why = why .. " - " .. degraded end
        last = {
            text = degraded or ("0 of %d eggs match your filters  \u{B7}  waiting"):format(field),
            n = 0, field = field, degraded = degraded,
        }
        return nil, why
    end

    function M.matchCount()
        local list = eggs.list()
        local n = 0
        for _, e in ipairs(list or {}) do
            if wanted(e) then n = n + 1 end
        end
        return n
    end

    return M
end)

BX.module("features.farm.treadmill_on", function(BX)
    local svc = BX.require("core.services")
    local data = BX.require("core.data")
    local ch  = BX.require("core.character")
    local dev = BX.require("core.device")
    local net = BX.require("core.net")
    local st  = BX.require("core.state")
    local log = BX.require("boot.log").for_module("farm.treadmill")

    local M = {}

    local K = {
        POLL     = 1.0,    
        DRIFT    = 6,      
        STEP_OFF = 14,     
    }
    M.K = K

    local PlotState = data.plotState()

    local sc = nil
    local enabled = false
    local stats = { nudges = 0, paused = 0, doffed = 0, noSpot = 0 }
    function M.stats() return table.clone(stats) end
    function M.isOn() return enabled end

    function M.spot()
        local slot
        BX.try("farm.treadmill.slot", function()
            slot = PlotState and PlotState.ResolveLocalSlot and PlotState.ResolveLocalSlot()
        end)
        if not slot then return nil end

        local pos
        BX.try("farm.treadmill.spot", function()
            local folder = workspace:FindFirstChild("__ClientTreadmillRenders")
            local render = folder and folder:FindFirstChild("TreadmillRender_" .. tostring(slot))
            local root = render and render:FindFirstChild("Root")
            if root and root:IsA("BasePart") then
                pos = root.Position
                return
            end
            local plots = workspace:FindFirstChild("Plots")
            local plot = plots and plots:FindFirstChild(tostring(slot))
            local bottom = plot and plot:FindFirstChild("TreadmillBottom")
            if bottom and bottom:IsA("BasePart") then
                pos = bottom.Position + Vector3.new(0, 4, 0)
            end
        end)
        return pos
    end

    local function place(pos)
        local hrp = ch.root()
        if not hrp or not pos then return false end
        local ok = BX.try("farm.treadmill.place", function()
            hrp.CFrame = CFrame.new(pos)
        end)
        return ok and true or false
    end

    local function step()
        if not enabled then return end

        if st.autoStealOn then
            stats.paused = stats.paused + 1
            return
        end

        local pos = M.spot()
        if not pos then
            stats.noSpot = stats.noSpot + 1
            return
        end

        local hrp = ch.root()
        if not hrp then return end
        if (hrp.Position - pos).Magnitude > K.DRIFT then
            if place(pos) then
                stats.nudges = stats.nudges + 1
                log.trace("nudged back onto the belt")
            end
        end
    end

    function M.setEnabled(on)
        on = on and true or false
        if on == enabled then return true end

        if on then

            if st.autoStealOn then
                log.warn("refused - Auto Steal is running")
                return false, "Turn Auto Steal off first"
            end

            local pos = M.spot()
            if not pos then
                log.warn("refused - could not resolve your treadmill")
                return false, "Could not find your treadmill"
            end

            enabled = true
            st.stayOnTreadmill = true          
            place(pos)

            sc = BX.scope("features.farm.treadmill_on")
            sc:loop("hold", dev.scale(K.POLL), step)

            ch.onSpawn(sc, "farm.treadmill.respawn", function()
                if enabled and not st.autoStealOn then place(M.spot()) end
            end)

            log.info("holding on the belt (poll %.1fs)", dev.scale(K.POLL))
            return true
        end

        enabled = false
        st.stayOnTreadmill = false
        if sc then sc:destroy() sc = nil end

        local ok, msg = net.call("RF/Treadmill/AskDoff")
        if ok == true then
            stats.doffed = stats.doffed + 1
        else
            log.warn("AskDoff refused: %s %s", tostring(ok), tostring(msg or ""))
        end

        local pos = M.spot()
        if pos then place(pos + Vector3.new(0, 3, K.STEP_OFF)) end

        log.info("released (%d nudges, %d paused for a run)", stats.nudges, stats.paused)
        return true
    end

    return M
end)

BX.module("features.farm.pets", function(BX)
    local net = BX.require("core.net")
    local log = BX.require("boot.log").for_module("farm.pets")

    local M = {}

    local stats = { asked = 0, equipped = 0, refused = 0 }
    function M.stats() return table.clone(stats) end

    function M.equipBest()
        stats.asked = stats.asked + 1
        local ok, msg = net.call("RF/Haul/WearBest")
        if ok == true then
            stats.equipped = stats.equipped + 1
            log.info("equipped best pets")
            return true, "Equipped your best pets"
        end
        stats.refused = stats.refused + 1
        log.warn("WearBest refused: %s %s", tostring(ok), tostring(msg or ""))
        return false, "Refused: " .. tostring(msg or ok)
    end

    return M
end)

BX.module("features.esp.cards", function(BX)
    local svc = BX.require("core.services")
    local dev = BX.require("core.device")
    local log = BX.require("boot.log").for_module("esp.cards")

    local M = {}

    local K = {
        W = 190, H = 40,
        VIS_HZ = 12,          
        MAX_DIST = 2200,      
        FADE_BAND = 260,      
        BASE_ALPHA = 0.42,    
        BASE_STROKE = 0.55,

        BUILD_PER_FRAME = 3,
    }
    M.K = K

    local C = {
        bgTop   = Color3.fromRGB(26, 26, 30),
        bgBot   = Color3.fromRGB(14, 14, 17),
        accent  = Color3.fromRGB(206, 206, 212),
        element = Color3.fromRGB(41, 41, 48),
        title   = Color3.fromRGB(246, 242, 234),
        sub     = Color3.fromRGB(168, 158, 144),
    }

    M.STYLE = {
        titleFont = Enum.Font.GothamBold, titleSize = 13,
        subFont   = Enum.Font.Gotham,     subSize   = 10,
    }
    M.COL = {
        income = "57F287", neutral = "F0F0F6", mutation = "F0BE5A",
        dim = "8A8A92", ready = "57F287",
    }
    M.SEP = "  \u{B7}  "

    function M.tint(col, text)
        return ('<font color="#%s">%s</font>'):format(col, text)
    end

    function M.hex(c)
        return ("%02X%02X%02X"):format(
            math.floor(c.R * 255 + 0.5), math.floor(c.G * 255 + 0.5),
            math.floor(c.B * 255 + 0.5))
    end

    local function scaleFor(dist)
        return math.clamp(1.25 - (tonumber(dist) or 0) / 800, 0.6, 1.25)
    end

    local sc, folder, handles = nil, nil, 0
    local pools = {}      

    local build, apply

    local function ensure()
        if sc then return end
        sc = BX.scope("features.esp.cards")
        folder = Instance.new("Folder")
        folder.Name = "BlyxoESP"
        sc:own(folder)
        folder.Parent = workspace

        local acc, step = 0, 1 / K.VIS_HZ
        sc:onFrame("vis", svc.RunService.RenderStepped, function(dt)

            local budget = dev.budget(K.BUILD_PER_FRAME)
            for _, pool in pairs(pools) do
                if budget <= 0 then break end
                for i, d in pairs(pool.pending) do
                    if budget <= 0 then break end
                    local c = build()
                    pool[i] = c
                    pool.n = pool.n + 1
                    if i > pool.high then pool.high = i end
                    apply(c, d)
                    pool.pending[i] = nil
                    budget = budget - 1
                end
            end

            acc = acc + (dt or 0)
            if acc < step then return end
            acc = 0
            local cam = workspace.CurrentCamera
            if not cam then return end
            local eye = cam.CFrame.Position

            for _, pool in pairs(pools) do
                for i = 1, pool.shown do
                    local c = pool[i]
                    if c and c.anchor.Parent then
                        local d = (c.pos - eye).Magnitude
                        local show = d <= K.MAX_DIST
                        if c.bb.Enabled ~= show then c.bb.Enabled = show end
                        if show then
                            local s = scaleFor(d)
                            if math.abs(c.lastScale - s) > 0.01 or c.lastH ~= c.baseH then
                                c.lastScale, c.lastH = s, c.baseH
                                c.scale.Scale = s
                                c.bb.Size = UDim2.fromOffset(K.W * s, c.baseH * s)
                            end
                            local fade = math.clamp((K.MAX_DIST - d) / K.FADE_BAND, 0, 1)
                            if math.abs(c.lastFade - fade) > 0.02 then
                                c.lastFade = fade
                                c.frame.BackgroundTransparency = 1 - (1 - K.BASE_ALPHA) * fade
                                c.title.TextTransparency = 1 - fade
                                c.sub.TextTransparency = 1 - fade
                                c.icon.ImageTransparency = 1 - fade
                                c.stroke.Transparency = 1 - (1 - K.BASE_STROKE) * fade
                            end
                        end
                    end
                end
            end
        end)
    end

    function build()
        local anchor = Instance.new("Part")
        anchor.Name = "EggAnchor"
        anchor.Anchored = true
        anchor.CanCollide = false
        anchor.CanQuery = false
        anchor.CanTouch = false
        anchor.CastShadow = false
        anchor.Transparency = 1
        anchor.Size = Vector3.new(0.2, 0.2, 0.2)
        anchor.Parent = folder

        local bb = Instance.new("BillboardGui")
        bb.Name = "EggCard"
        bb.AlwaysOnTop = true
        bb.LightInfluence = 0
        bb.MaxDistance = 1e6          
        bb.Size = UDim2.fromOffset(K.W, K.H)
        bb.StudsOffset = Vector3.new(0, 3, 0)
        bb.Active = false
        bb.Adornee = anchor
        bb.Enabled = false
        bb.Parent = anchor

        local frame = Instance.new("Frame")
        frame.Size = UDim2.fromOffset(K.W, K.H)
        frame.BackgroundColor3 = Color3.new(1, 1, 1)
        frame.BackgroundTransparency = K.BASE_ALPHA
        frame.BorderSizePixel = 0
        frame.ClipsDescendants = true
        frame.Parent = bb
        Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 8)

        local grad = Instance.new("UIGradient", frame)
        grad.Color = ColorSequence.new(C.bgTop, C.bgBot)
        grad.Rotation = 90

        local scaleObj = Instance.new("UIScale")
        scaleObj.Scale = 1
        scaleObj.Parent = frame

        local stroke = Instance.new("UIStroke", frame)
        stroke.Color = Color3.new(1, 1, 1)
        stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
        stroke.Thickness = 1
        stroke.Transparency = K.BASE_STROKE
        local sg = Instance.new("UIGradient", stroke)
        sg.Color = ColorSequence.new(C.accent, C.element)
        sg.Rotation = 90

        local accent = Instance.new("Frame")
        accent.Name = "Accent"
        accent.Position = UDim2.fromOffset(3, 4)
        accent.Size = UDim2.new(0, 2, 1, -8)
        accent.BorderSizePixel = 0
        accent.BackgroundColor3 = Color3.fromRGB(194, 142, 54)
        accent.Parent = frame
        Instance.new("UICorner", accent).CornerRadius = UDim.new(1, 0)

        local icon = Instance.new("ImageLabel")
        icon.Name = "Icon"
        icon.Position = UDim2.fromOffset(9, 8)
        icon.Size = UDim2.fromOffset(24, 24)
        icon.BackgroundTransparency = 1
        icon.ScaleType = Enum.ScaleType.Fit
        icon.Image = ""
        icon.Parent = frame

        local title = Instance.new("TextLabel")
        title.Name = "Title"
        title.Position = UDim2.fromOffset(38, 3)
        title.Size = UDim2.new(1, -44, 0, 15)
        title.BackgroundTransparency = 1
        title.Font = Enum.Font.GothamBold
        title.TextSize = 12
        title.TextColor3 = C.title
        title.TextXAlignment = Enum.TextXAlignment.Left
        title.TextTruncate = Enum.TextTruncate.AtEnd
        title.Text = ""
        title.Parent = frame

        local sub = Instance.new("TextLabel")
        sub.Name = "Sub"
        sub.Position = UDim2.fromOffset(38, 18)
        sub.Size = UDim2.new(1, -44, 0, 20)
        sub.BackgroundTransparency = 1
        sub.Font = Enum.Font.Gotham
        sub.TextSize = 10
        sub.TextColor3 = C.sub
        sub.TextXAlignment = Enum.TextXAlignment.Left
        sub.TextYAlignment = Enum.TextYAlignment.Top
        sub.RichText = true          
        sub.Text = ""
        sub.Parent = frame

        return {
            anchor = anchor, bb = bb, frame = frame, stroke = stroke,
            accent = accent, icon = icon, title = title, sub = sub,
            scale = scaleObj, pos = Vector3.zero, baseH = K.H,
            lastScale = -1, lastFade = -1, lastH = -1,
            lastTitle = nil, lastSub = nil, lastIcon = nil, lastStyle = nil,
        }
    end

    function apply(c, d)
        if c.pos ~= d.pos then
            c.pos = d.pos
            c.anchor.CFrame = CFrame.new(d.pos)
        end

        local h = (d.lines and d.lines > 1) and (K.H + 12) or K.H
        if c.baseH ~= h then
            c.baseH = h
            c.frame.Size = UDim2.fromOffset(K.W, h)
            c.sub.Size = UDim2.new(1, -44, 0, h - 20)
        end

        local titleText = (d.target and "\u{25B8} " or "") .. tostring(d.title or "")
        if titleText ~= c.lastTitle then
            c.lastTitle = titleText
            c.title.Text = titleText
        end
        if d.sub ~= c.lastSub then
            c.lastSub = d.sub
            c.sub.Text = tostring(d.sub or "")
        end
        if d.icon ~= c.lastIcon then
            c.lastIcon = d.icon
            c.icon.Image = tostring(d.icon or "")
        end
        if d.accent then c.accent.BackgroundColor3 = d.accent end

        local st = d.style
        if st ~= c.lastStyle then
            c.lastStyle = st
            c.title.Font = (st and st.titleFont) or Enum.Font.GothamBold
            c.title.TextSize = (st and st.titleSize) or 12
            c.sub.Font = (st and st.subFont) or Enum.Font.Gotham
            c.sub.TextSize = (st and st.subSize) or 10
        end
    end

    local Handle = {}
    Handle.__index = Handle

    function Handle:show(i, d)
        local pool = pools[self.name]
        local c = pool[i]
        if not c then
            pool.pending[i] = d
            return
        end
        apply(c, d)
    end

    function Handle:shown(n)
        local pool = pools[self.name]
        pool.shown = n
        for i = n + 1, pool.high do
            local c = pool[i]
            if c and c.bb.Enabled then c.bb.Enabled = false end
        end

        for i in pairs(pool.pending) do
            if i > n then pool.pending[i] = nil end
        end
    end

    function Handle:count()
        local pool = pools[self.name]
        return pool.n, pool.shown
    end

    function Handle:close()
        local pool = pools[self.name]
        for i = 1, pool.high do
            local c = pool[i]
            if c then pcall(function() c.anchor:Destroy() end) end
        end
        pools[self.name] = nil
        handles = handles - 1
        if handles <= 0 then
            handles = 0
            if sc then sc:destroy() sc = nil end
            folder, pools = nil, {}
            log.info("released")
        end
    end

    function M.open(name)
        ensure()
        handles = handles + 1
        pools[name] = { shown = 0, pending = {}, n = 0, high = 0 }
        return setmetatable({ name = name }, Handle)
    end

    function M.liveCount()
        local n = 0
        for _, pool in pairs(pools) do n = n + pool.n end
        return n
    end

    function M.pendingCount()
        local n = 0
        for _, pool in pairs(pools) do
            for _ in pairs(pool.pending) do n = n + 1 end
        end
        return n
    end

    BX.profile.watch("esp.cards", M.liveCount)
    BX.profile.watch("esp.cards.queued", M.pendingCount)

    return M
end)

BX.module("features.esp.eggs", function(BX)
    local dev   = BX.require("core.device")
    local eggs  = BX.require("features.eggs")
    local data  = BX.require("core.data")
    local cards = BX.require("features.esp.cards")
    local log   = BX.require("boot.log").for_module("esp.eggs")

    local M = {}

    local K = {
        REFRESH = 0.5,        
        MAX_CARDS = 40,       
        LIFT_BASE = 2.2,      
        LIFT_SCALE = 3.4,     
    }
    M.K = K

    local sc, handle, enabled = nil, nil, false
    local stats = { updates = 0, listed = 0, shown = 0 }
    function M.stats() return table.clone(stats) end
    function M.isOn() return enabled end

    local STYLE, COL, SEP, tint, hex = cards.STYLE, cards.COL, cards.SEP, cards.tint, cards.hex

    local function rate(n)
        n = tonumber(n) or 0
        for _, u in ipairs({ { 1e12, "T" }, { 1e9, "B" }, { 1e6, "M" }, { 1e3, "K" } }) do
            if n >= u[1] then
                local v = n / u[1]
                local txt = (v < 10) and ("%.2f"):format(v) or ("%.1f"):format(v)
                return (txt:gsub("%.?0+$", "")) .. u[2]
            end
        end
        return tostring(math.floor(n))
    end

    local scratch = {}

    local function update()
        if not enabled or not handle then return end
        stats.updates = stats.updates + 1

        local cam = workspace.CurrentCamera
        local list = eggs.list()
        if not cam or not list then return end
        local dir = data.assetsDir()
        local eye = cam.CFrame.Position

        for i = #scratch, 1, -1 do scratch[i] = nil end
        for _, e in ipairs(list) do
            if e.pos and (e.pos - eye).Magnitude <= cards.K.MAX_DIST then
                scratch[#scratch + 1] = e
            end
        end
        stats.listed = #scratch
        table.sort(scratch, function(a, b) return (a.value or 0) > (b.value or 0) end)

        local n = math.min(#scratch, K.MAX_CARDS)
        for i = 1, n do
            local e = scratch[i]
            local d = e.assetCategory and dir and dir[e.assetCategory] or nil

            local colour = Color3.fromRGB(200, 200, 200)
            local rarityName = (e.rarity and e.rarity ~= "?") and e.rarity or nil
            if d and d.Rarity then
                if typeof(d.Rarity.Color) == "Color3" then colour = d.Rarity.Color end
                rarityName = rarityName or d.Rarity.DisplayName or d.Rarity._id
            end

            local bits = { tint(COL.income, "<b>" .. rate(e.value or 0) .. "/s</b>") }
            if rarityName then
                bits[#bits + 1] = tint(hex(colour), rarityName)
            end
            local kg = tonumber(e.kg) or 0
            if kg > 0 then
                bits[#bits + 1] = tint(COL.neutral,
                    kg >= 100 and ("%.0fkg"):format(kg) or ("%.1fkg"):format(kg))
            end
            local sub = table.concat(bits, SEP)

            local lines = 1
            if type(e.mutations) == "table" and #e.mutations > 0 then
                local names = {}
                for _, mu in ipairs(e.mutations) do
                    names[#names + 1] = tostring(type(mu) == "table"
                        and (mu.DisplayName or mu._id or "?") or mu)
                end
                sub = sub .. "\n" .. tint(COL.mutation, table.concat(names, " \u{B7} "))
                lines = 2
            end

            local lift = K.LIFT_BASE + (tonumber(e.assetScale) or 1) * K.LIFT_SCALE
            handle:show(i, {
                pos = e.pos + Vector3.new(0, lift, 0),
                title = e.name,
                sub = sub,
                accent = colour,
                icon = d and d.Icon or nil,
                lines = lines,
                target = e.isTarget,
                style = STYLE,
            })
        end
        handle:shown(n)
        stats.shown = n
    end

    function M.setEnabled(on)
        on = on and true or false
        if on == enabled then return true end
        enabled = on

        if not on then
            if handle then handle:close() handle = nil end
            if sc then sc:destroy() sc = nil end
            log.info("off")
            return true
        end

        handle = cards.open("eggs")
        sc = BX.scope("features.esp.eggs")
        sc:loop("update", dev.scale(K.REFRESH), update)
        log.info("on (max %d cards, %.2fs, range %d)",
            K.MAX_CARDS, dev.scale(K.REFRESH), cards.K.MAX_DIST)
        return true
    end

    return M
end)

BX.module("features.esp.plot", function(BX)
    local svc   = BX.require("core.services")
    local dev   = BX.require("core.device")
    local ch    = BX.require("core.character")
    local data  = BX.require("core.data")
    local util  = BX.require("core.util")
    local eggs  = BX.require("features.eggs")
    local cards = BX.require("features.esp.cards")
    local log   = BX.require("boot.log").for_module("esp.plot")

    local M = {}

    local K = { RATE = 0.5, MAX_CARDS = 24 }
    M.K = K

    local STYLE, COL, SEP, tint, hex = cards.STYLE, cards.COL, cards.SEP, cards.tint, cards.hex

    local sc, handle, enabled = nil, nil, false
    local stats = { updates = 0, eggs = 0, ready = 0 }
    function M.stats() return table.clone(stats) end
    function M.isOn() return enabled end

    local function timeLeft(seconds)
        seconds = math.max(0, math.floor(seconds))
        local h = math.floor(seconds / 3600)
        local m = math.floor(seconds / 60) % 60
        if h > 0 then return ("%dh %02dm"):format(h, m) end
        if m > 0 then return ("%dm %02ds"):format(m, seconds % 60) end
        return ("%ds"):format(seconds)
    end

    local function update()
        if not enabled or not handle then return end
        stats.updates = stats.updates + 1

        local rendered = workspace:FindFirstChild("PlacedEggRenders")
        if not rendered then
            handle:shown(0)
            stats.eggs = 0
            return
        end

        local ES = data.eggState()
        local dir = data.assetsDir()
        local me = svc.Players.LocalPlayer and svc.Players.LocalPlayer.UserId
        if not me then return end
        local prefix = tostring(me) .. "_"

        local recs = {}
        BX.try("esp.plot.readOwner", function()
            recs = (ES and ES.ReadOwnerEggs and ES.ReadOwnerEggs(me)) or {}
        end)

        local wanted, n, readyN = {}, 0, 0
        
        for _, m in ipairs(rendered:GetChildren()) do
            if m:IsA("Model") and m.Name:sub(1, #prefix) == prefix then
                local uid = m.Name:sub(#prefix + 1)
                local pos
                BX.try("esp.plot.pivot", function() pos = m:GetPivot().Position end)
                if pos then
                    n = n + 1
                    wanted[uid] = true

                    local rec = recs[uid]
                    local d = rec and dir and dir[rec.AssetCategory] or nil
                    local title = (d and d.DisplayName ~= "" and d.DisplayName)
                        or (rec and tostring(rec.AssetCategory)) or "Egg"
                    local rarity = d and d.Rarity
                        and tostring(d.Rarity.DisplayName or d.Rarity._id or "") or ""
                    local colour = (d and d.Rarity and typeof(d.Rarity.Color) == "Color3")
                        and d.Rarity.Color or Color3.fromRGB(190, 190, 200)

                    local muts = ""
                    if rec and type(rec.Mutations) == "table" and #rec.Mutations > 0 then
                        local names = {}
                        for _, mu in ipairs(rec.Mutations) do
                            names[#names + 1] = tostring(type(mu) == "table"
                                and (mu.DisplayName or mu._id or "?") or mu)
                        end
                        muts = table.concat(names, " \u{B7} ")
                    end

                    local ready = false
                    BX.try("esp.plot.ready", function()
                        ready = (ES and ES.IsReadyToHatch and ES.IsReadyToHatch(uid)) == true
                    end)
                    local when = "growing"
                    if ready then
                        readyN = readyN + 1
                        when = "READY"
                    elseif rec then
                        local grow = d and d.Egg and tonumber(d.Egg.GrowthTime)
                        local placed = rec.Placement and tonumber(rec.Placement.PlacedAt)
                        local mult = math.max(tonumber(rec.GrowthSpeedMultiplier) or 1, 0.01)
                        if grow and placed then
                            when = timeLeft(placed + grow / mult - os.time())
                        end
                    end

                    local rate = nil
                    if rec then
                        BX.try("esp.plot.value", function()
                            rate = eggs.value({
                                Uid = uid,
                                AssetCategory = rec.AssetCategory,
                                AssetScale = rec.AssetScale,
                                Mutations = rec.Mutations,
                            })
                        end)
                    end

                    local kg = d and d.Egg and tonumber(d.Egg.WeightKg)
                    if kg then kg = kg * (tonumber(rec and rec.AssetScale) or 1) end
                    if kg and kg <= 0 then kg = nil end

                    local bits = {}
                    if rate and rate > 0 then
                        bits[#bits + 1] = tint(COL.income, "<b>" .. eggs.formatRate(rate) .. "/s</b>")
                    end
                    if rarity ~= "" then
                        bits[#bits + 1] = tint(hex(colour), rarity)
                    end
                    if kg then
                        bits[#bits + 1] = tint(COL.neutral, kg >= 100
                            and ("%.0fkg"):format(kg) or ("%.1fkg"):format(kg))
                    end
                    local line1 = table.concat(bits, SEP)

                    local state = ready and tint(COL.ready, "<b>READY</b>") or tint(COL.dim, when)
                    local line2 = (muts ~= "") and (tint(COL.mutation, muts) .. SEP .. state) or state

                    local sub = line1 .. "\n" .. line2
                    local lines = 2

                    local lift = 2.2 + (tonumber(rec and rec.AssetScale) or 1) * 3.4
                    handle:show(n, {
                        pos = pos + Vector3.new(0, lift, 0),
                        title = title, sub = sub, accent = colour,
                        icon = d and d.Icon or nil, lines = lines,
                        target = ready, style = STYLE,
                    })
                end
            end
        end

        handle:shown(n)
        stats.eggs, stats.ready = n, readyN
    end

    function M.setEnabled(on)
        on = on and true or false
        if on == enabled then return true end
        enabled = on

        if not on then
            if handle then handle:close() handle = nil end
            if sc then sc:destroy() sc = nil end
            log.info("off")
            return true
        end

        handle = cards.open("plot")
        sc = BX.scope("features.esp.plot")
        sc:loop("update", dev.scale(K.RATE), update)
        
        ch.onSpawn(sc, "esp.plot.respawn", function()
            if handle then handle:shown(0) end
        end)
        log.info("on (%.2fs)", dev.scale(K.RATE))
        return true
    end

    return M
end)

BX.module("features.misc.servers", function(BX)
    local svc  = BX.require("core.services")
    local exec = BX.require("core.exec")
    local log  = BX.require("boot.log").for_module("servers")

    local M = {}

    local K = {
        MAX_PAGES = 5, TRIES = 4,

        FAILED_FOR = 600,     
        FAILED_MAX = 200,     

        TP_SETTLE  = 2.5,
    }
    M.K = K

    local searching = false

    local failed, failedN = {}, 0

    BX.profile.watch("servers.failed", function() return failedN end)

    local function pruneFailed()
        local now = os.clock()
        local live, n = {}, 0
        for id, at in pairs(failed) do
            if (now - at) > K.FAILED_FOR then
                failed[id] = nil
            else
                n = n + 1
                live[n] = id
            end
        end

        if n > K.FAILED_MAX then
            table.sort(live, function(a, b) return failed[a] < failed[b] end)
            for i = 1, n - K.FAILED_MAX do
                failed[live[i]] = nil
            end
            n = K.FAILED_MAX
        end
        failedN = n
    end

    local function markFailed(id)
        if not id then return end
        failed[id] = os.clock()
        pruneFailed()
    end

    local function canFetch()
        if exec.can.request then return true end
        local ok, f = pcall(function() return game.HttpGet end)
        return ok and type(f) == "function"
    end

    local function fetchPage(cursor)
        local url = ("https://games.roblox.com/v1/games/%d/servers/Public"
            .. "?sortOrder=Asc&limit=100"):format(game.PlaceId)
        if cursor then url = url .. "&cursor=" .. tostring(cursor) end
        local body, via, status
        if exec.can.request then
            local res
            BX.try("servers.fetch", function()
                res = exec.httpRequest({ Url = url, Method = "GET" })
            end)
            body = res and (res.Body or res.body)
            status = res and (res.StatusCode or res.status_code)
            via = "request"
        end
        if not body then
            local ok, got = pcall(function() return game:HttpGet(url) end)
            if ok and type(got) == "string" then body, via = got, "HttpGet"
            elseif not ok then status = tostring(got) end
        end
        if not body then
            log.warn("server list: no response (via %s, %s)", tostring(via), tostring(status))
            return nil, "no response" .. (tostring(status):find("429") and " - rate limited, wait a few seconds" or "")
        end
        local decoded
        pcall(function() decoded = svc.HttpService:JSONDecode(body) end)
        if type(decoded) ~= "table" or type(decoded.data) ~= "table" then
            log.warn("server list: unreadable (via %s, status %s, %d bytes: %s)",
                tostring(via), tostring(status), #body, body:sub(1, 80))
            return nil, "unreadable list"
        end
        log.info("server list: page via %s, %d servers%s", via, #decoded.data,
            decoded.nextPageCursor and ", more pages" or "")
        return decoded
    end

    local function candidates()
        pruneFailed()
        local out, cursor = {}, nil
        local here = tostring(game.JobId)
        local listed, pages, why = 0, 0, nil
        for _ = 1, K.MAX_PAGES do
            local page, err = fetchPage(cursor)
            if not page then why = why or err break end
            pages = pages + 1
            for _, sv in ipairs(page.data) do
                listed = listed + 1

                local playing = tonumber(sv.playing) or 0
                local maxP = tonumber(sv.maxPlayers) or 0
                if sv.id and sv.id ~= here             
                   and not failed[sv.id]               
                   and maxP > 0 and playing < maxP     
                then
                    out[#out + 1] = {
                        id = sv.id, playing = playing, maxPlayers = maxP,
                        ping = tonumber(sv.ping) or 0,
                    }
                end
            end
            cursor = page.nextPageCursor
            if not cursor then break end
        end
        log.info("candidates: %d of %d listed over %d page(s) (here=%s, failed cache=%d)",
            #out, listed, pages, here:sub(1, 8), failedN)
        return out, listed, why
    end

    local function teleport(sv)
        local failedWhy = nil
        local conn
        pcall(function()
            conn = svc.TeleportService.TeleportInitFailed:Connect(function(plr, result, msg)
                if plr == svc.Players.LocalPlayer then
                    failedWhy = tostring(result) .. " " .. tostring(msg or "")
                end
            end)
        end)

        log.info("teleporting to %s (%d/%d players)", tostring(sv.id):sub(1, 8),
            sv.playing, sv.maxPlayers)
        pcall(function() BX.require("boot.log").flushNow() end)
        local ok, err = pcall(function()
            svc.TeleportService:TeleportToPlaceInstance(game.PlaceId, sv.id,
                svc.Players.LocalPlayer)
        end)
        if ok then
            local t0 = os.clock()
            while not failedWhy and (os.clock() - t0) < K.TP_SETTLE do task.wait(0.1) end
        end
        if conn then pcall(function() conn:Disconnect() end) end
        if not ok or failedWhy then
            markFailed(sv.id)

            log.warn("teleport to %s failed: %s", tostring(sv.id):sub(1, 8),
                tostring(failedWhy or err))
            return false, failedWhy or err
        end
        log.info("teleport requested: %s (%d/%d players)", tostring(sv.id):sub(1, 8),
            sv.playing, sv.maxPlayers)
        return true
    end

    local function go(order, what)
        if searching then return false, "Already searching" end
        if not canFetch() then
            log.warn("%s: no HTTP capability on this executor (request=%s)", what, tostring(exec.can.request))
            return false, "Server search is not supported by this executor"
        end
        searching = true
        log.info("%s: click", what)

        local okRun, ok, msg = pcall(function()
            local list, listed, why = candidates()
            if #list == 0 then
                if listed == 0 then
                    return false, "Could not read the server list" .. (why and (" (" .. why .. ")") or "")
                end
                return false, ("All %d listed servers are full or recently refused us"):format(listed)
            end
            table.sort(list, order)

            local lastWhy
            for i = 1, math.min(#list, K.TRIES) do
                local sv = list[i]
                local tpOk, tpWhy = teleport(sv)
                if tpOk then
                    log.info("%s: joining %d/%d players", what, sv.playing, sv.maxPlayers)
                    return true, ("Joining a server with %d players"):format(sv.playing)
                end
                lastWhy = tpWhy
            end
            return false, "Teleport refused " .. math.min(#list, K.TRIES) .. " times"
                .. (lastWhy and (" (" .. tostring(lastWhy) .. ")") or "") .. " - press again"
        end)

        searching = false
        if not okRun then
            log.warn("%s: failed: %s", what, tostring(ok))
            return false, "Server search failed - see the log"
        end
        return ok, msg
    end

    function M.lowestServer()
        return go(function(a, b)
            if a.playing ~= b.playing then return a.playing < b.playing end
            
            local ap = a.ping > 0 and a.ping or math.huge
            local bp = b.ping > 0 and b.ping or math.huge
            return ap < bp
        end, "lowest")
    end

    function M.hop()

        return go(function(a, b) return a.playing < b.playing end, "hop")
    end

    function M.stats()
        pruneFailed()
        return { failedServers = failedN, searching = searching }
    end

    return M
end)

BX.module("features.misc.webhook", function(BX)
    local svc  = BX.require("core.services")
    local exec = BX.require("core.exec")
    local util = BX.require("core.util")
    local log  = BX.require("boot.log").for_module("webhook")

    local M = {}

    local K = { MIN_GAP = 3.0, TIMEOUT = 8 }
    M.K = K

    local enabled = false
    local url = nil              
    local lastSend = 0
    local stats = { sent = 0, failed = 0, dropped = 0, skipped = 0 }

    function M.stats() return table.clone(stats) end
    function M.isOn() return enabled end
    function M.hasUrl() return url ~= nil and url ~= "" end

    function M.redactedUrl()
        if not M.hasUrl() then return "not set" end
        local host = tostring(url):match("^https?://([^/]+)") or "?"
        return ("%s/...(%d chars)"):format(host, #url)
    end

    function M.setEnabled(on)
        enabled = on and true or false
        log.info("%s (url %s)", enabled and "enabled" or "disabled", M.redactedUrl())
        return true
    end

    function M.setUrl(v)
        v = tostring(v or ""):gsub("%s", "")
        if v == "" then
            url = nil
            log.info("url cleared")
            return true, "URL cleared"
        end
        if not v:match("^https://") then
            return false, "That does not look like a webhook URL"
        end
        url = v
        log.info("url set (%s)", M.redactedUrl())
        return true, "Webhook URL saved"
    end

    local function embedFor(e)
        local fields = {}
        local function add(name, value)
            if value == nil or value == "" then return end
            fields[#fields + 1] = { name = name, value = tostring(value), inline = true }
        end

        add("Income", (e.value and (util.short(e.value) .. "/s")) or nil)
        add("Weight", e.kg and e.kg > 0 and ("%.1f kg"):format(e.kg) or nil)
        add("Rarity", e.rarity ~= "?" and e.rarity or nil)
        add("Mutation", e.mutation)
        add("Area", e.areaId)

        return {
            username = "BlyxoHub",
            embeds = { {
                title = "Egg delivered",
                description = "**" .. tostring(e.name or "Egg") .. "**",
                color = 5814783,
                fields = fields,
                footer = { text = "BlyxoHub " .. tostring(BX.version) },
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
            } },
        }
    end

    local function post(payload, tag)
        if not exec.can.request then
            stats.skipped = stats.skipped + 1
            log.warn("no HTTP request capability - nothing sent")
            return false
        end
        local body
        local okEnc = pcall(function() body = svc.HttpService:JSONEncode(payload) end)
        if not okEnc or not body then
            stats.failed = stats.failed + 1
            return false
        end

        local res
        local ok = BX.try("webhook.post", function()
            res = exec.httpRequest({
                Url = url, Method = "POST",
                Headers = { ["Content-Type"] = "application/json" },
                Body = body,
            })
        end)
        local code = res and (res.StatusCode or res.status_code)
        if ok and code and code >= 200 and code < 300 then
            stats.sent = stats.sent + 1
            log.info("%s sent (HTTP %s)", tag, tostring(code))
            return true
        end
        stats.failed = stats.failed + 1
        
        log.warn("%s failed (HTTP %s)", tag, tostring(code or "no response"))
        return false
    end

    function M.onDelivered(e)
        if not enabled or not M.hasUrl() or type(e) ~= "table" then return end

        local now = os.clock()
        if now - lastSend < K.MIN_GAP then
            stats.dropped = stats.dropped + 1
            return
        end
        lastSend = now

        task.spawn(function()
            BX.try("webhook.delivered", function()
                post(embedFor(e), "delivery")
            end)
        end)
    end

    function M.test()
        if not M.hasUrl() then return false, "Set a webhook URL first" end
        task.spawn(function()
            BX.try("webhook.test", function()
                post({
                    username = "BlyxoHub",
                    embeds = { {
                        title = "Test",
                        description = "Webhook is working.",
                        color = 5814783,
                        footer = { text = "BlyxoHub " .. tostring(BX.version) },
                        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                    } },
                }, "test")
            end)
        end)
        return true, "Test sent"
    end

    return M
end)

BX.module("features.misc.appearance", function(BX)
    local svc = BX.require("core.services")
    local win = BX.require("ui.window")
    local log = BX.require("boot.log").for_module("appearance")

    local M = {}

    local K = { FADE = 0.35, CORNER = 12 }
    M.K = K

    local sc = nil
    local current = { theme = nil, background = nil }

    local function themeApi()
        local lib = win.lib
        if type(lib) == "table" then
            for _, name in ipairs({ "SetTheme", "ChangeTheme", "ApplyTheme" }) do
                if type(lib[name]) == "function" then
                    return function(v) lib[name](lib, v) end, name
                end
            end
        end
        local w = win.window
        if type(w) == "table" then
            for _, name in ipairs({ "SetTheme", "ChangeTheme" }) do
                if type(w[name]) == "function" then
                    return function(v) w[name](w, v) end, name
                end
            end
        end
        return nil
    end

    function M.themeSupported() return (themeApi()) ~= nil end

    function M.themes()
        local lib = win.lib
        local names = {}
        if type(lib) == "table" and type(lib.Theme) == "table" then
            for k in pairs(lib.Theme) do names[#names + 1] = tostring(k) end
        end
        if #names == 0 then
            names = { "Default", "Amethyst", "Green", "Bloom", "DarkBlue",
                      "Light", "Serenity" }
        end
        table.sort(names)
        return names
    end

    function M.setTheme(name)
        name = tostring(name or "")
        if name == "" then return false, "Pick a theme" end
        local apply, via = themeApi()
        if not apply then
            log.warn("this Rayfield build exposes no theme API")
            return false, "This menu build has no theme support"
        end
        if not BX.try("appearance.setTheme", function() apply(name) end) then
            return false, "That theme was refused"
        end
        current.theme = name
        log.info("theme set to %s (via %s)", name, tostring(via))

        return true, "Theme: " .. name
    end

    local bgLabel, savedFill, guardConn = nil, nil, nil
    local request = 0        

    local function restoreWindowFill()
        if guardConn then
            pcall(function() guardConn:Disconnect() end)
            guardConn = nil
        end
        if bgLabel and savedFill ~= nil then
            pcall(function()
                local host = bgLabel.Parent
                if host then host.BackgroundTransparency = savedFill end
            end)
        end
        savedFill = nil
    end

    local function findHost()
        local gui = win.screen
        if not gui or not gui.Parent then return nil end
        local best, bestArea
        for _, f in ipairs(gui:GetChildren()) do
            if f:IsA("Frame") and f.Visible then
                local a = f.AbsoluteSize.X * f.AbsoluteSize.Y
                if not bestArea or a > bestArea then best, bestArea = f, a end
            end
        end
        return best
    end

    local function applyBackground(id)
        restoreWindowFill()
        if bgLabel then pcall(function() bgLabel:Destroy() end) end
        bgLabel = nil

        id = tostring(id or ""):gsub("%s", "")
        if id == "" then
            current.background = nil

            local bgSc = BX._scopes["features.misc.appearance.background"]
            if bgSc and not bgSc.dead then bgSc:destroy() end
            return true, "cleared"
        end
        if not id:match("^%d+$") then
            id = id:match("(%d+)") or ""
            if id == "" then return false, "that is not an image id" end
        end

        local host = findHost()
        if not host then return false, "could not find the hub window" end

        local bgSc = BX.scope("features.misc.appearance.background")

        local img = Instance.new("ImageLabel")
        img.Name = "BlyxoBackground"
        img.Size = UDim2.fromScale(1, 1)
        img.Image = "rbxassetid://" .. id
        img.ScaleType = Enum.ScaleType.Crop
        img.ImageTransparency = K.FADE

        img.BackgroundColor3 = Color3.fromRGB(16, 16, 20)
        img.BackgroundTransparency = 0
        img.BorderSizePixel = 0
        img.ZIndex = 0
        Instance.new("UICorner", img).CornerRadius = UDim.new(0, K.CORNER)
        bgSc:own(img)
        img.Parent = host

        savedFill = host.BackgroundTransparency
        host.BackgroundTransparency = 1
        bgLabel = img
        current.background = id

        guardConn = bgSc:connect(host:GetPropertyChangedSignal("BackgroundTransparency"),
            function()
                if bgLabel == img and img.Parent == host
                   and host.BackgroundTransparency ~= 1 then
                    savedFill = host.BackgroundTransparency
                    host.BackgroundTransparency = 1
                end
            end)

        local mine = request
        bgSc:spawn("bgLoad", function()
            for _ = 1, 5 do
                task.wait(0.2)
                if img.Parent == nil or request ~= mine then return end
                if img.IsLoaded then log.info("background loaded directly") return end
            end
            if img.Parent == nil or request ~= mine then return end

            img.Image = ("rbxthumb://type=Asset&id=%s&w=420&h=420"):format(id)
            for _ = 1, 25 do
                task.wait(0.2)
                if img.Parent == nil or request ~= mine then return end
                if img.IsLoaded then
                    log.info("background loaded through the thumbnail endpoint")
                    return
                end
            end
            if img.Parent then
                log.warn("id %s would not load either way", id)
                BX.try("appearance.bgNotify", function()
                    win.notify("Appearance", "Roblox will not serve that id as an image", 4)
                end)
            end
        end)

        return true, "applied"
    end

    function M.setBackground(id)
        request = request + 1
        local mine = request
        local ok, why = applyBackground(id)

        if not ok and tostring(why):find("could not find the hub window") then
            sc = sc or BX.scope("features.misc.appearance")
            sc:spawn("bgWait", function()
                for _ = 1, 60 do
                    task.wait(0.5)
                    if request ~= mine then return end
                    local ok2, why2 = applyBackground(id)
                    if ok2 or not tostring(why2):find("could not find the hub window") then
                        log.info("background: %s (once the window was up)", tostring(why2))
                        return
                    end
                end
                log.warn("gave up - the hub window never appeared")
            end)
            return true, "Waiting for the window"
        end

        if ok then log.info("background %s (id %s)", why, tostring(id)) end
        return ok, ok and ("Background " .. why) or ("Background failed - " .. why)
    end

    function M.clearBackground()
        request = request + 1
        applyBackground("")
        return true, "Background cleared"
    end

    function M.currentBackground() return current.background end

    function M.read()
        return { theme = current.theme, background = current.background }
    end

    function M.apply(t)
        if type(t) ~= "table" then return end
        if t.theme then M.setTheme(t.theme) end
        if t.background and tostring(t.background) ~= "" then
            M.setBackground(t.background)
        end
    end

    function M.reset()
        restoreWindowFill()
        if sc then sc:destroy() sc = nil end
        bgLabel, guardConn = nil, nil
        current = { theme = nil, background = nil }
    end

    return M
end)

BX.module("features.fps", function(BX)
    local svc = BX.require("core.services")
    local log = BX.require("boot.log").for_module("fps")

    local M = {}

    local K = {
        MAX_TRACKED = 4000,   
        CHUNK       = 1200,   
        PRUNE_EVERY = 30,     
        DEFER       = 2.0,    
    }
    M.K = K

    local EFFECTS = {
        ParticleEmitter = true, Trail = true, Beam = true,
        Smoke = true, Fire = true, Sparkles = true,
    }

    local POST = {
        BloomEffect = true, BlurEffect = true, ColorCorrectionEffect = true,
        SunRaysEffect = true, DepthOfFieldEffect = true,
    }

    local env = (type(getgenv) == "function" and getgenv()) or _G
    local ENV_KEY = "__BLYXO_FPS"

    local function newRecord()
        return { props = {}, n = 0 }
    end

    local function restoreRecord(rec, why)
        if type(rec) ~= "table" or type(rec.props) ~= "table" then return 0 end
        local put = 0
        for i = #rec.props, 1, -1 do
            local e = rec.props[i]

            if e and e.obj then
                local ok = pcall(function() e.obj[e.key] = e.was end)
                if ok then put = put + 1 end
            end
            rec.props[i] = nil
        end
        rec.n = 0
        log.info("restored %d properties (%s)", put, tostring(why))
        return put
    end

    if type(env[ENV_KEY]) == "table" then
        local stale = env[ENV_KEY]
        env[ENV_KEY] = nil
        BX.try("fps.restoreStale", function()
            restoreRecord(stale, "previous copy, before re-applying")
        end)
    end

    local sc, rec, enabled, sweeping = nil, nil, false, false
    local stats = { effects = 0, props = 0, added = 0, pruned = 0, refused = 0,
                    sweepMs = 0 }

    function M.isOn() return enabled end
    function M.stats()
        local s = table.clone(stats)
        s.tracked = rec and rec.n or 0
        return s
    end

    BX.profile.watch("fps.tracked", function() return rec and rec.n or 0 end)

    local function remember(obj, key, value)
        if not rec then return false end
        if rec.n >= K.MAX_TRACKED then

            stats.refused = stats.refused + 1
            if stats.refused == 1 then
                log.warn("tracking ceiling of %d reached - further effects left as they are",
                    K.MAX_TRACKED)
            end
            return false
        end
        local was
        if not pcall(function() was = obj[key] end) then return false end
        if was == value then return false end      
        if not pcall(function() obj[key] = value end) then return false end
        rec.n = rec.n + 1
        rec.props[rec.n] = { obj = obj, key = key, was = was }
        return true
    end

    local function offLimits(d)
        local espRoot = workspace:FindFirstChild("BlyxoESP")
        if espRoot and d:IsDescendantOf(espRoot) then return true end
        local char = svc.Players.LocalPlayer and svc.Players.LocalPlayer.Character
        if char and d:IsDescendantOf(char) then return true end
        return false
    end

    local function handle(d)
        local cls = d.ClassName
        if not (EFFECTS[cls] or POST[cls]) then return false end
        if EFFECTS[cls] and offLimits(d) then return false end
        if remember(d, "Enabled", false) then
            stats.effects = stats.effects + 1
            return true
        end
        return false
    end

    local function sweep()
        if sweeping then return end
        sweeping = true
        local t0 = os.clock()

        for _, d in ipairs(svc.Lighting:GetDescendants()) do
            BX.try("fps.sweepPost", handle, d)
        end

        local desc = workspace:GetDescendants()
        local total = #desc
        local i = 1
        while i <= total do
            local stop = math.min(i + K.CHUNK - 1, total)
            for j = i, stop do
                local d = desc[j]
                if d then BX.try("fps.sweepOne", handle, d) end
            end
            i = stop + 1

            svc.RunService.Heartbeat:Wait()
            if not enabled or not (sc and sc:alive()) then break end
        end

        stats.sweepMs = (os.clock() - t0) * 1000
        sweeping = false
        log.info("sweep: %d descendants, %d effects off, %.1fms",
            total, stats.effects, stats.sweepMs)
    end

    local function applyGlobals()

        remember(svc.Lighting, "GlobalShadows", false)

        local ter = workspace:FindFirstChildOfClass("Terrain")
        if ter then

            remember(ter, "Decoration", false)
            remember(ter, "WaterWaveSize", 0)
            remember(ter, "WaterWaveSpeed", 0)
            remember(ter, "WaterReflectance", 0)
        end

        BX.try("fps.quality", function()
            local r = settings().Rendering
            remember(r, "QualityLevel", Enum.QualityLevel.Level01)
        end)
        stats.props = rec and rec.n or 0
    end

    function M.setEnabled(on)
        on = on and true or false
        if on == enabled then return true end
        enabled = on

        if not on then

            if sc then sc:destroy() sc = nil end
            local put = restoreRecord(rec, "toggled off")
            rec = nil
            env[ENV_KEY] = nil
            stats.effects, stats.props = 0, 0
            log.info("off (%d properties restored)", put)
            return true
        end

        rec = newRecord()

        env[ENV_KEY] = rec

        sc = BX.scope("features.fps")
        applyGlobals()
        sc:spawn("sweep", sweep)

        sc:connect(workspace.DescendantAdded, BX.guard("fps.added", function(d)
            if not enabled then return end
            if handle(d) then stats.added = stats.added + 1 end
        end))
        sc:connect(svc.Lighting.DescendantAdded, BX.guard("fps.addedPost", function(d)
            if not enabled then return end
            if handle(d) then stats.added = stats.added + 1 end
        end))

        sc:loop("prune", K.PRUNE_EVERY, function()
            if not rec then return end
            local props, keep = rec.props, 0
            local dropped = 0
            for i = 1, rec.n do
                local e = props[i]
                local gone = false
                if e and e.obj then

                    if typeof(e.obj) == "Instance" and e.obj.Parent == nil then
                        gone = true
                    end
                else
                    gone = true
                end
                if gone then
                    dropped = dropped + 1
                else
                    keep = keep + 1
                    props[keep] = e
                end
            end
            for i = keep + 1, rec.n do props[i] = nil end
            rec.n = keep
            if dropped > 0 then
                stats.pruned = stats.pruned + dropped
                log.trace("pruned %d destroyed effects (%d tracked)", dropped, keep)
            end
        end)

        log.info("on")
        return true
    end

    local armed = false
    function M.arm()
        if armed then return false end
        armed = true
        task.delay(K.DEFER, function()
            if not BX.alive() then return end
            if enabled then return end
            if M.userTurnedOff then return end
            BX.try("fps.armApply", function() M.setEnabled(true) end)
        end)
        return true
    end

    return M
end)

BX.module("features.boss", function(BX)
    local svc = BX.require("core.services")
    local dev = BX.require("core.device")
    local net = BX.require("core.net")
    local log = BX.require("boot.log").for_module("boss")

    local M = {}

    local K = {

        SNAP_TTL  = 5,

        BACKSTOP  = 30,

        ENTER_GAP = 1.0,

        RETRY     = { 5, 10, 20 },
    }
    M.K = K

    local sc, enabled = nil, false
    local snap, snapAt = nil, 0
    local retryN, retryArmed = 0, false
    local autoEnter = false
    local stats = { asks = 0, enters = 0, entersRefused = 0, claims = 0,
                    stateEvents = 0, autoEntered = 0 }

    function M.stats() return table.clone(stats) end
    function M.isOn() return enabled end
    function M.autoEnterOn() return autoEnter end

    local listeners = {}
    function M.onChange(fn) listeners[#listeners + 1] = fn end
    local function fireChange()
        for _, fn in ipairs(listeners) do
            task.spawn(function() BX.try("boss.onChange", fn) end)
        end
    end

    function M.snapshot(force)
        if not enabled then return nil end
        local now = os.clock()
        if not force and snap and (now - snapAt) < K.SNAP_TTL then return snap end
        stats.asks = stats.asks + 1
        local st = net.call("RF/BossEvent/AskSnapshot")
        snapAt = now
        if type(st) == "table" then snap = st end
        return snap
    end

    function M.isOpen()
        local s = M.snapshot()
        return (s and s.Open == true) or false
    end

    function M.held() return snap end

    local function clock(seconds)
        seconds = math.max(0, math.floor(seconds or 0))
        local h = math.floor(seconds / 3600)
        local m = math.floor(seconds / 60) % 60
        if h > 0 then return ("%dh %02dm"):format(h, m) end
        if m > 0 then return ("%dm %02ds"):format(m, seconds % 60) end
        return ("%ds"):format(seconds)
    end

    function M.status()
        if not enabled then return { title = "Abyss Overlord", body = "off" } end
        local s = snap
        if not s then
            return { title = "Abyss Overlord", body = (stats.asks > 0)
                and "Unavailable  \u{B7}  retrying"
                or "Reading..." }
        end

        local nowSrv = workspace:GetServerTimeNow()
        if s.Open == true then
            local left = (tonumber(s.ClosesAt) or 0) - nowSrv
            return { title = "Abyss Overlord",
                     body = ("OPEN  \u{B7}  closes in %s"):format(clock(left)) }
        end
        local until_ = (tonumber(s.OpensAt) or 0) - nowSrv
        if until_ > 0 then
            return { title = "Abyss Overlord",
                     body = ("Closed  \u{B7}  opens in %s"):format(clock(until_)) }
        end
        return { title = "Abyss Overlord", body = "Closed" }
    end

    function M.refresh()
        if not enabled then return false end
        task.spawn(function()
            BX.try("boss.refresh", function()
                M.snapshot(true)
                fireChange()
            end)
        end)
        return true
    end

    local function readOrRetry()
        local st = M.snapshot(true)
        if st then
            retryN = 0
            return st
        end
        if retryArmed or not sc then return nil end
        local wait = K.RETRY[retryN + 1]
        if not wait then return nil end
        retryArmed = true
        log.warn("boss read failed - retrying in %ds", wait)
        sc:delay("retry", dev.scale(wait), function()
            retryArmed = false
            retryN = retryN + 1
            if readOrRetry() then fireChange() end
        end)
        return nil
    end

    function M.enter()
        stats.enters = stats.enters + 1
        local accepted, msg = net.call("RF/BossEvent/AskEnter")
        log.info("AskEnter -> accepted=%s msg=%s", tostring(accepted), tostring(msg))
        if accepted == true then
            return true, "Entering the boss world"
        end
        stats.entersRefused = stats.entersRefused + 1
        if msg and tostring(msg):find("defeated") then
            return false, "Boss already defeated - waiting for the next one"
        end
        return false, tostring(msg or "Refused")
    end

    function M.setAutoEnter(on)
        autoEnter = on and true or false
        log.info("auto enter %s", autoEnter and "ON" or "OFF")

        if autoEnter and enabled and M.isOpen() then
            task.spawn(function()
                BX.try("boss.autoEnterNow", function()
                    local ok, why = M.enter()
                    if ok then stats.autoEntered = stats.autoEntered + 1 end
                    log.info("auto enter (already open) -> %s %s", tostring(ok), tostring(why))
                end)
            end)
        end
        return true
    end

    function M.claimMilestones()
        local BM
        local okReq = BX.try("boss.requireMastery", function()
            local mod = svc.ReplicatedStorage:FindFirstChild("Data")
            mod = mod and mod:FindFirstChild("BossMastery")
            if mod and mod:IsA("ModuleScript") then BM = require(mod) end
        end)
        if not okReq or type(BM) ~= "table" then
            log.warn("Data.BossMastery unavailable - cannot claim")
            return 0, "Could not read the mastery list"
        end

        local ids = {}
        for _, m in pairs(BM.Milestones or {}) do
            if type(m) == "table" and m.Id then ids[#ids + 1] = tostring(m.Id) end
        end
        if BM.InfiniteMilestoneId then ids[#ids + 1] = tostring(BM.InfiniteMilestoneId) end

        local claimed = 0
        for _, id in ipairs(ids) do
            local got, msg = net.call("RF/BossMastery/AskClaimMilestone", id)
            if got == true then
                claimed = claimed + 1
                log.info("claimed milestone %s", id)
            elseif msg and not tostring(msg):find("Not enough") then
                log.trace("milestone %s -> %s", id, tostring(msg))
            end

            task.wait(0.15)
        end
        stats.claims = stats.claims + claimed
        return claimed, claimed > 0 and ("Claimed " .. claimed) or "Nothing to claim yet"
    end

    function M.setEnabled(on)
        on = on and true or false
        if on == enabled then return true end

        if not on then
            enabled = false
            autoEnter = false
            if sc then sc:destroy() sc = nil end
            snap, snapAt = nil, 0
            retryN, retryArmed = 0, false
            log.info("off (%d snapshot reads this session)", stats.asks)
            fireChange()
            return true
        end

        sc = BX.scope("features.boss")
        enabled = true

        BX.try("boss.watchState", function()
            local re = net.find("RE/BossEvent/StateShifted")
            if not re then
                log.warn("RE/BossEvent/StateShifted not found - running on the backstop")
                return
            end
            sc:connect(re.OnClientEvent, function()
                stats.stateEvents = stats.stateEvents + 1
                task.spawn(function()
                    BX.try("boss.stateShifted", function()
                        local was = snap and snap.Open
                        M.snapshot(true)
                        local isOpen = snap and snap.Open
                        log.info("state shifted: open %s -> %s",
                            tostring(was), tostring(isOpen))
                        fireChange()
                        
                        if autoEnter and isOpen == true and was ~= true then
                            task.wait(K.ENTER_GAP)
                            local ok, why = M.enter()
                            if ok then stats.autoEntered = stats.autoEntered + 1 end
                            log.info("auto enter on open -> %s %s",
                                tostring(ok), tostring(why))
                        end
                    end)
                end)
            end)
        end)

        sc:loop("backstop", dev.scale(K.BACKSTOP), function()
            local had, was = snap ~= nil, snap and snap.Open
            readOrRetry()
            if not had or (snap and snap.Open) ~= was then fireChange() end
        end)

        log.info("on (StateShifted event + %.0fs backstop)", dev.scale(K.BACKSTOP))
        return true
    end

    return M
end)

BX.module("features.rift", function(BX)
    local svc  = BX.require("core.services")
    local dev  = BX.require("core.device")
    local data = BX.require("core.data")
    local net  = BX.require("core.net")
    local eggs = BX.require("features.eggs")
    local log  = BX.require("boot.log").for_module("rift")

    local M = {}

    local K = {

        BACKSTOP    = 30,

        SNAP_TTL    = 5,

        STALE_MAX   = 8,
        
        DEBOUNCE    = 0.35,

        RETRY       = { 5, 10, 20 },
        NONE_LABEL  = "No pets spawned",
    }
    M.K = K

    local sc        = nil
    local enabled   = false
    local snap, snapAt, snapOkAt = nil, 0, 0
    local retryN, retryArmed = 0, false
    local fieldIds  = nil      
    local ownedHave, ownedMiss = nil, nil
    local pick      = nil      
    local labelToId = {}
    local dirty     = false

    local stats = {
        askState = 0, askFailed = 0, repaints = 0, coalesced = 0,
        rotations = 0, pickCleared = 0,
    }
    function M.stats() return table.clone(stats) end
    function M.isOn() return enabled end

    local listeners = {}
    function M.onChange(fn) listeners[#listeners + 1] = fn end

    local function fireChange()
        stats.repaints = stats.repaints + 1
        for _, fn in ipairs(listeners) do
            task.spawn(function() BX.try("rift.onChange", fn) end)
        end
    end

    function M.petName(id)
        local dir = data.assetsDir()
        local cfg = dir and dir[id]
        return (cfg and cfg.DisplayName and tostring(cfg.DisplayName)) or tostring(id)
    end

    local function petNames(ids)
        local out = {}
        for _, id in ipairs(ids or {}) do out[#out + 1] = M.petName(id) end
        return out
    end

    function M.state(force)
        if not enabled then return nil end
        local now = os.clock()
        if not force and snap and (now - snapAt) < K.SNAP_TTL then
            return snap
        end

        stats.askState = stats.askState + 1
        local st = net.call("RF/Rift/AskState")
        snapAt = now

        if type(st) == "table" then
            snap, snapOkAt = st, now
            return snap
        end

        stats.askFailed = stats.askFailed + 1
        if (now - snapOkAt) > K.STALE_MAX then
            
            snap = nil
        end
        return snap
    end

    function M.requirements()
        local st = M.state()
        local reqs = st and st.Requirements
        if type(reqs) ~= "table" then return {} end
        return reqs
    end

    local function computeOwned()
        local reqs = M.requirements()
        if #reqs == 0 then
            ownedHave, ownedMiss = nil, nil
            return
        end

        local counts = nil
        BX.try("rift.readInventory", function()
            local Save = svc.ReplicatedStorage:FindFirstChild("Save", true)
            if not (Save and Save:IsA("ModuleScript")) then return end
            local mod = require(Save)
            if type(mod) ~= "table" or type(mod.Get) ~= "function" then return end
            local profile = mod.Get(svc.LocalPlayer)
            local inv = profile and profile.Inventory
            if type(inv) ~= "table" then return end
            counts = {}
            for _, row in pairs(inv) do
                local cat = type(row) == "table" and row.Category or nil
                if cat then counts[cat] = (counts[cat] or 0) + 1 end
            end
        end)

        if not counts then

            ownedHave, ownedMiss = nil, nil
            return
        end

        local have, missing = 0, {}
        for _, id in ipairs(reqs) do
            if (counts[id] or 0) > 0 then
                have = have + 1
            else
                missing[#missing + 1] = id
            end
        end
        ownedHave, ownedMiss = have, missing
    end

    function M.owned()
        if ownedHave == nil and ownedMiss == nil then computeOwned() end
        return ownedHave, ownedMiss
    end

    local function computeField()
        local reqs = M.requirements()
        if #reqs == 0 then
            fieldIds = nil
            return
        end
        local want = {}
        for _, id in ipairs(reqs) do want[id] = true end

        local list = eggs.list()
        if not list then
            fieldIds = nil
            return
        end

        local seen, out = {}, {}
        for _, e in ipairs(list) do
            local cat = e.assetCategory
            if cat and want[cat] and not seen[cat] then
                seen[cat] = true
                out[#out + 1] = cat
            end
        end
        fieldIds = out
    end

    function M.onField()
        if not enabled then return {} end
        if not fieldIds then computeField() end
        return fieldIds or {}
    end

    function M.petIsOut(id)
        if not id then return false end
        for _, out in ipairs(M.onField()) do
            if out == id then return true end
        end
        return false
    end

    function M.options()
        local out = {}
        labelToId = {}
        for _, id in ipairs(fieldIds or {}) do
            local label = M.petName(id)
            labelToId[label] = id
            out[#out + 1] = label
        end
        if #out == 0 then out[1] = K.NONE_LABEL end
        return out
    end

    function M.idForLabel(label)
        if type(label) ~= "string" or label == K.NONE_LABEL then return nil end
        return labelToId[label] or label
    end

    function M.pick() return pick end

    function M.setPick(id)
        pick = id
        if id then
            log.info("targeting %s", M.petName(id))
        else
            log.info("targeting any required rift pet")
        end
    end

    local function prunePick()
        if not pick then return false end
        if M.petIsOut(pick) then return false end
        stats.pickCleared = stats.pickCleared + 1
        log.info("%s is no longer out - clearing the pick", M.petName(pick))
        pick = nil
        return true
    end

    function M.status()
        if not enabled then return { title = "Rift", body = "off" } end

        local st = snap
        if not st then
            return { title = "Rift", body = (stats.askState > 0)
                and "Unavailable  \u{B7}  retrying"
                or "Reading..." }
        end

        if st.Unlocked == false then
            local need = tonumber(st.UnlockSpeedPower)
            return {
                title = "Rift",
                body = need
                    and ("Unlocks at " .. eggs.formatRate(need) .. " speed")
                    or "Locked",
            }
        end

        local reqs = st.Requirements or {}
        local have, missing = ownedHave, ownedMiss
        local banner = tostring(st.BannerDisplayName or st.BannerId or "Rift")
        local secs = (tonumber(st.SecondsUntilRotation) or 0) - (os.clock() - snapOkAt)
        local mins = math.max(0, math.floor(secs / 60))

        local title = have and ("%s  %d/%d"):format(banner, have, #reqs) or banner

        local extras = {}
        local pity, pityMax = tonumber(st.PityCount), tonumber(st.PityThreshold)
        if pity and pityMax then
            extras[#extras + 1] = ("pity %d/%d"):format(pity, pityMax)
        end
        local free = tonumber(st.FreeRefreshesRemaining)
        if free then extras[#extras + 1] = ("%d free"):format(free) end
        local tail = ("%dm"):format(mins)
        if #extras > 0 then tail = tail .. "  \u{B7}  " .. table.concat(extras, "  \u{B7}  ") end

        if have and #reqs > 0 and have >= #reqs then
            return { title = title, body = ("All pets ready  \u{B7}  new rift in %s"):format(tail) }
        end

        local want = (missing and #missing > 0) and missing or reqs
        if #want == 0 then
            return { title = title, body = ("New rift in %s"):format(tail) }
        end

        local outSet = {}
        for _, id in ipairs(fieldIds or {}) do outSet[id] = true end

        local ready = {}
        for _, id in ipairs(want) do
            if outSet[id] then ready[#ready + 1] = M.petName(id) end
        end

        local body
        if #ready > 0 then
            body = ("Steal %s now"):format(table.concat(ready, ", "))
        elseif #want == 1 then
            body = ("Need %s  \u{B7}  not spawned"):format(M.petName(want[1]))
        else
            body = ("Need %d: %s  \u{B7}  none spawned")
                :format(#want, table.concat(petNames(want), ", "))
        end

        return { title = title, body = ("%s  \u{B7}  %s"):format(body, tail) }
    end

    function M.eligible()
        if not enabled then return false end
        local have, missing = M.owned()
        
        if have and #M.requirements() > 0 and have >= #M.requirements() then
            return false
        end
        local need = {}
        for _, id in ipairs((missing and #missing > 0) and missing or M.requirements()) do
            need[id] = true
        end
        if pick then return M.petIsOut(pick) and need[pick] ~= nil end
        for _, id in ipairs(M.onField()) do
            if need[id] then return true end
        end
        return false
    end

    function M.pickTarget()
        if not enabled then return nil, "rift is off" end

        local have, missing = M.owned()
        local reqs = M.requirements()
        if #reqs == 0 then return nil, "rift has no requirements" end
        if have and have >= #reqs then return nil, "all rift pets owned" end

        local need = {}
        for _, id in ipairs((missing and #missing > 0) and missing or reqs) do
            need[id] = true
        end

        local list = eggs.list()
        if not list then return nil, "no egg list" end

        for _, e in ipairs(list) do
            local cat = e.assetCategory
            if cat and need[cat] then
                if pick then
                    if cat == pick then return e end
                else
                    return e
                end
            end
        end

        return nil, pick
            and ("%s is not on the field"):format(M.petName(pick))
            or "no required rift pet is on the field"
    end

    local tradeSc, tradeOn, trading = nil, false, false
    local mark          
    function M.autoTradeOn() return tradeOn end

    local function riftHave(reqs)
        if type(reqs) ~= "table" or #reqs == 0 then return nil end
        local out, okAny = {}, false
        for _, r in ipairs(reqs) do out[r] = out[r] or { owned = 0, uids = {} } end
        BX.try("rift.tradeInventory", function()
            local Save = svc.ReplicatedStorage:FindFirstChild("Save", true)
            if not (Save and Save:IsA("ModuleScript")) then return end
            local mod = require(Save)
            local prof = type(mod) == "table" and mod.Get and mod.Get(svc.LocalPlayer)
            local inv = prof and prof.Inventory
            if type(inv) ~= "table" then return end
            okAny = true
            local FuseKernel, AssetItems
            pcall(function() FuseKernel = require(svc.ReplicatedStorage.Shared.Util.FuseKernel) end)
            pcall(function() AssetItems = require(svc.ReplicatedStorage.Shared.Util.AssetItems) end)
            local equipped = {}
            for _, u in pairs(prof.EquippedAssets or {}) do equipped[u] = true end
            local weight = {}
            for uid, row in pairs(inv) do
                local cat = type(row) == "table" and (row.Category or (row.ItemData and row.ItemData.Category))
                local slot = cat and out[cat]
                if slot then
                    slot.owned = slot.owned + 1
                    local may = not equipped[uid]
                    if may and FuseKernel and FuseKernel.MayEnterRift then
                        local ok, r = pcall(FuseKernel.MayEnterRift, uid, row)
                        may = ok and r == true
                    end
                    if may then
                        local w = math.huge
                        if AssetItems then
                            pcall(function() w = AssetItems.WeightKg(AssetItems.Decode(row)) end)
                        end
                        weight[uid] = w
                        slot.uids[#slot.uids + 1] = uid
                    end
                end
            end
            for _, slot in pairs(out) do
                table.sort(slot.uids, function(a, b) return (weight[a] or 0) < (weight[b] or 0) end)
            end
        end)
        return okAny and out or nil
    end

    local function tryTrade()
        if trading then return nil end
        trading = true
        local result = nil
        BX.try("rift.tryTrade", function()
            local st = M.state(true)
            if type(st) ~= "table" then return end
            if st.PendingReward then
                net.call("RF/Rift/AskFinishReveal")
                result = "revealed"
                return
            end
            local reqs = st.Requirements
            if type(reqs) ~= "table" or #reqs < 3 then return end
            local have = riftHave(reqs)
            if not have then return end
            local uids, used = {}, {}
            for i = 1, 3 do
                local slot = have[reqs[i]]
                for _, u in ipairs(slot and slot.uids or {}) do
                    if not used[u] then uids[i] = u used[u] = true break end
                end
                if not uids[i] then return end      
            end
            local res, msg = net.call("RF/Rift/AskTradeIn", uids)
            if res ~= true then
                result = "refused: " .. tostring(msg or res)
                return
            end
            task.wait(1)
            net.call("RF/Rift/AskFinishReveal")
            result = "traded"
        end)
        trading = false
        if result then
            
            ownedHave, ownedMiss = nil, nil
            mark("traded")
        end
        return result
    end

    local tradeListeners = {}
    function M.onTrade(fn) tradeListeners[#tradeListeners + 1] = fn end

    function M.setAutoTrade(on)
        on = on and true or false
        if on == tradeOn then return true end
        tradeOn = on
        if not on then
            if tradeSc then tradeSc:destroy() tradeSc = nil end
            log.info("auto trade-in OFF")
            return true
        end
        if not enabled then M.setEnabled(true) end
        tradeSc = BX.scope("features.rift.trade")

        tradeSc:loop("trade", dev.scale(5), function()
            local r = tryTrade()
            if r == "traded" then
                log.info("traded the 3 pets in - Rift Egg claimed")
            elseif r == "revealed" then
                log.info("finished a pending reveal")
            elseif r then
                log.warn("trade-in %s", tostring(r))
            end
            if r then
                for _, fn in ipairs(tradeListeners) do
                    task.spawn(function() BX.try("rift.onTrade", fn, r) end)
                end
            end
        end)
        log.info("auto trade-in ON (every 5s, lightest eligible pet of each kind, never equipped)")
        return true
    end

    local scheduleRetry

    local function recompute(why, full)
        dirty = false
        if full then
            snapAt = 0            
            local st = M.state(true)
            if st then
                retryN = 0
            else
                scheduleRetry()
            end
        end

        if full or (ownedHave == nil and ownedMiss == nil) then computeOwned() end
        computeField()
        prunePick()
        log.trace("recomputed (%s)", tostring(why))
        fireChange()
    end

    scheduleRetry = function()
        if retryArmed or not sc then return end
        local wait = K.RETRY[retryN + 1]
        if not wait then return end
        retryArmed = true
        log.warn("rift read failed - retrying in %ds", wait)
        sc:delay("retry", dev.scale(wait), function()
            retryArmed = false
            retryN = retryN + 1
            recompute("retry " .. retryN, true)
        end)
    end

    M.refresh = function(why)

        if not enabled then return false end
        eggs.invalidate("rift refresh")
        recompute(why or "manual refresh", true)
        return true
    end

    mark = function(why)
        if dirty then
            stats.coalesced = stats.coalesced + 1
            return
        end
        dirty = true
        if not sc then return end
        sc:delay("recompute", K.DEBOUNCE, function()
            if dirty then recompute(why, false) end
        end)
    end

    function M.setEnabled(on)
        on = on and true or false
        if on == enabled then return true end

        if not on then
            enabled = false
            if sc then sc:destroy() sc = nil end
            
            snap, snapAt, snapOkAt = nil, 0, 0
            fieldIds, ownedHave, ownedMiss = nil, nil, nil
            labelToId, dirty = {}, false
            retryN, retryArmed = 0, false
            pick = nil
            log.info("off (%d state reads, %d repaints this session)",
                stats.askState, stats.repaints)
            fireChange()
            return true
        end

        sc = BX.scope("features.rift")
        enabled = true

        BX.try("rift.watchRotation", function()
            local re = net.find("RE/Rift/BannerRotated")
            if not re then
                log.warn("RE/Rift/BannerRotated not found - running on the backstop")
                return
            end
            sc:connect(re.OnClientEvent, function()
                stats.rotations = stats.rotations + 1
                log.info("banner rotated - re-reading")

                task.spawn(function()
                    BX.try("rift.rotated", function() recompute("banner rotated", true) end)
                end)
            end)
        end)

        BX.try("rift.watchField", function()
            local ES = data.eggState()
            if not ES then return end
            for _, name in ipairs({ "FieldRefreshed", "FieldGone", "FieldShifted" }) do
                local sig = ES[name]
                if sig and type(sig) == "table" and type(sig.Connect) == "function" then
                    sc:connect(sig, function() mark("field " .. name) end)
                end
            end
        end)

        BX.try("rift.watchSave", function()
            local Save = svc.ReplicatedStorage:FindFirstChild("Save", true)
            if not (Save and Save:IsA("ModuleScript")) then return end
            local mod = require(Save)
            local sig = type(mod) == "table" and mod.FieldChanged or nil
            if sig and type(sig) == "table" and type(sig.Connect) == "function" then
                sc:connect(sig, function(field)
                    if field == nil or field == "Inventory" then
                        ownedHave, ownedMiss = nil, nil
                        mark("inventory changed")
                    end
                end)
            end
        end)

        sc:loop("backstop", dev.scale(K.BACKSTOP), function()
            recompute(snap and "backstop" or "first read", true)
        end)

        log.info("on (rotation event + field signals, backstop %.0fs)",
            dev.scale(K.BACKSTOP))
        return true
    end

    return M
end)

BX.module("features.eggs", function(BX)
    local svc = BX.require("core.services")
    local dev = BX.require("core.device")
    local data = BX.require("core.data")
    local log = BX.require("boot.log").for_module("eggs")

    local M = {}

    local K = {
        CACHE_TTL       = 0.5,   
        MIN_REBUILD     = 0.1,   
        RAW_TTL         = 0.25,  
        FALLBACK_TTL    = 5.0,   
        STOLEN_FOR      = 120,   
        UNREACHABLE_FOR = 45,    
        PARTIAL_FLOOR   = 8,     
        FULL_FIELD_MIN  = 10,    
        VALUE_CACHE_MAX = 600,   
    }
    M.K = K

    local EggState, AssetEarnings, AssetsDir
    BX.try("eggs.resolveModules", function()
        EggState = data.eggState()
        AssetEarnings = data.assetEarnings()

        AssetsDir = data.assetsDir()
    end)
    M.ready = (EggState ~= nil)
    if not M.ready then
        log.error("EggState not found - is this Steal An Egg?")
    end

    local rawSnap, rawSnapAt = nil, 0
    local dirty, dirtyReason = false, nil
    local list, listAt       = nil, 0
    local fallbackAt         = 0
    local sawFullField       = false
    local saidPartial        = false
    local stolen             = {}   
    local unreachable        = {}   
    local valueCache         = {}   
    local valueCacheN        = 0

    local stats = {
        scans = 0, cacheHits = 0, partialHeld = 0, fallbacks = 0,
        signals = 0, dirtyRebuilds = 0,
        lastScanMs = 0, lastConsidered = 0, lastKept = 0,
    }

    BX.profile.watch("eggs.list", function() return list and #list or 0 end)
    BX.profile.watch("eggs.values", function() return valueCacheN end)
    BX.profile.watch("eggs.unreachable", function()
        local n = 0
        for _ in pairs(unreachable) do n = n + 1 end
        return n
    end)
    BX.profile.watch("eggs.stolen", function()
        local n = 0
        for _ in pairs(stolen) do n = n + 1 end
        return n
    end)

    function M.invalidate(reason)
        list, listAt = nil, 0
        rawSnap, rawSnapAt = nil, 0
        dirty = false
        if reason then log.trace("invalidated: %s", reason) end
    end

    function M.markDirty(reason)
        dirty = true
        dirtyReason = reason
        stats.signals = (stats.signals or 0) + 1
    end

    function M.markStolen(uid)
        if uid then stolen[tostring(uid)] = os.clock() end
    end

    function M.markUnreachable(uid)
        if uid then unreachable[tostring(uid)] = os.clock() end
    end

    function M.clearUnreachable(uid)
        if uid then unreachable[tostring(uid)] = nil end
    end

    local function pruneStolen()
        local now = os.clock()
        for uid, at in pairs(stolen) do
            if (now - at) > K.STOLEN_FOR then stolen[uid] = nil end
        end
        for uid, at in pairs(unreachable) do
            if (now - at) > K.UNREACHABLE_FOR then unreachable[uid] = nil end
        end
    end

    local function calcValue(rec)
        local uid = rec.Uid
        local hit = valueCache[uid]
        if hit then return hit end

        local item = {
            Category  = rec.AssetCategory,
            Scale     = tonumber(rec.AssetScale) or 1,
            Mutations = rec.Mutations or {},
        }

        local v = 0
        if AssetEarnings then
            local ok, rate = pcall(AssetEarnings.LiveRatePerSecond, item, nil, nil, svc.LocalPlayer)
            if ok and type(rate) == "number" then
                v = rate
            else
                
                ok, rate = pcall(AssetEarnings.MutationOnlyRatePerSecond, item)
                if ok and type(rate) == "number" then v = rate end
            end
        end

        if valueCacheN >= K.VALUE_CACHE_MAX then
            log.warn("value cache hit %d entries - clearing", valueCacheN)
            valueCache, valueCacheN = {}, 0
        end
        valueCache[uid] = v
        valueCacheN = valueCacheN + 1
        return v
    end

    M.value = calcValue

    local function displayName(rec)
        local dir = AssetsDir and AssetsDir[rec.AssetCategory]

        return (dir and dir.DisplayName) or rec.AssetCategory
            or ("Egg " .. tostring(rec.Uid or "?"):sub(1, 6))
    end

    local function rarityIdOf(rec)
        local dir = AssetsDir and AssetsDir[rec.AssetCategory]
        if dir and dir.Rarity then
            return dir.Rarity._id or dir.Rarity.DisplayName or "?"
        end
        return "?"
    end

    local function rarityOf(rec)
        local dir = AssetsDir and AssetsDir[rec.AssetCategory]
        if dir and dir.Rarity then
            return dir.Rarity.DisplayName or dir.Rarity._id or "?"
        end
        return "?"
    end

    local function weightOf(rec)
        local dir = AssetsDir and AssetsDir[rec.AssetCategory]
        local base = dir and dir.Egg and tonumber(dir.Egg.WeightKg)
        if not base then return 0 end
        return base * (tonumber(rec.AssetScale) or 1)
    end

    function M.formatRate(n)
        n = tonumber(n) or 0
        for _, u in ipairs({ { 1e12, "T" }, { 1e9, "B" }, { 1e6, "M" }, { 1e3, "K" } }) do
            if n >= u[1] then
                local v = n / u[1]
                local txt = (v < 10) and string.format("%.2f", v) or string.format("%.1f", v)
                return (txt:gsub("%.?0+$", "")) .. u[2]
            end
        end
        return tostring(math.floor(n))
    end

    local function readField()
        local records = nil
        BX.try("eggs.readField", function()
            local data = EggState and EggState.ReadFieldEggs and EggState.ReadFieldEggs()
            if type(data) == "table" and type(data.Records) == "table" then
                records = data.Records
            end
        end)
        return records
    end

    local function readFallback()
        local now = os.clock()
        if (now - fallbackAt) < K.FALLBACK_TTL then return nil end
        fallbackAt = now
        stats.fallbacks = stats.fallbacks + 1

        local records = {}
        BX.try("eggs.fallback", function()
            local slots = workspace:FindFirstChild("AreaEggSlotsClient")
            if not slots then return end

            for _, m in ipairs(slots:GetChildren()) do
                if m:IsA("Model") then
                    local uid = m:GetAttribute("Uid") or m:GetAttribute("EggUid") or m.Name
                    local cf
                    local hit = m:FindFirstChild("Hitbox")
                    if hit and hit:IsA("BasePart") then cf = hit.CFrame else cf = m:GetPivot() end
                    if uid and cf then

                        records[#records + 1] = {
                            Uid = tostring(uid), BoundsCFrame = cf, State = "Slot",
                        }
                    end
                end
            end
        end)
        log.info("fallback scan: %d records from AreaEggSlotsClient (no EggState - names and values unavailable)", #records)
        return #records > 0 and records or nil
    end

    local function snapshot(force)
        local now = os.clock()
        if not force and rawSnap and (now - rawSnapAt) < dev.scale(K.RAW_TTL) then
            return rawSnap
        end
        local records = readField()
        if not records or #records == 0 then
            records = readFallback() or records
        end
        if records then
            rawSnap, rawSnapAt = records, now
        end
        return rawSnap
    end

    function M.list(opts, force)
        opts = opts or {}
        local now = os.clock()

        local fresh = (now - listAt) < dev.scale(K.CACHE_TTL)
        local mayRebuild = (now - listAt) >= K.MIN_REBUILD
        if not force and list and fresh and not (dirty and mayRebuild) then
            stats.cacheHits = stats.cacheHits + 1
            return list
        end
        if dirty and mayRebuild then
            stats.dirtyRebuilds = (stats.dirtyRebuilds or 0) + 1
            dirty = false
        end

        local t0 = os.clock()
        local records = snapshot(force)

        local n = records and #records or 0
        if n > K.FULL_FIELD_MIN then sawFullField = true end
        if sawFullField and n > 0 and n <= K.PARTIAL_FLOOR and list and #list > 0 then
            if not saidPartial then
                saidPartial = true
                stats.partialHeld = stats.partialHeld + 1
                log.info("only %d records replicated - field still loading, keeping the last %d",
                    n, #list)
            end
            return list
        end
        saidPartial = false

        if not records then
            list = list or {}
            listAt = now
            return list
        end

        pruneStolen()

        local TAKEABLE = opts.state or { Slot = true, Dropped = true }
        local out, seen = {}, {}
        local considered, dupes = 0, 0

        for _, rec in ipairs(records) do
            considered = considered + 1
            local uid = rec.Uid and tostring(rec.Uid)

            if uid and not seen[uid] then
                seen[uid] = true

                if not TAKEABLE[rec.State] then
                    
                elseif stolen[uid] then
                    
                elseif unreachable[uid] then
                    
                else
                    local value = calcValue(rec)
                    local pos = rec.BoundsCFrame and rec.BoundsCFrame.Position
                    if pos and (not opts.minValue or value >= opts.minValue)
                       and (not opts.filter or opts.filter(rec, value)) then
                        out[#out + 1] = {
                            uid   = uid,
                            state = rec.State,
                            pos   = pos,          
                            value = value,
                            name  = displayName(rec),
                            rarity = rarityOf(rec),
                            rarityId = rarityIdOf(rec),

                            assetCategory = rec.AssetCategory,

                            assetScale = rec.AssetScale,
                            mutations = rec.Mutations,
                            kg    = weightOf(rec),
                            guardHeld = (rec.State == "GuardCarried"),
                            dropped   = (rec.State == "Dropped"),

                            areaId = rec.AreaId,
                            nestId = rec.NestId,
                        }
                    end
                end
            elseif uid then
                dupes = dupes + 1
            end
        end

        table.sort(out, function(a, b) return a.value > b.value end)

        if valueCacheN > (#out * 2 + 50) then
            local keep, kept = {}, 0
            for _, e in ipairs(out) do
                local v = valueCache[e.uid]
                if v ~= nil then
                    keep[e.uid] = v
                    kept = kept + 1
                end
            end
            log.trace("value cache pruned %d -> %d (field %d)", valueCacheN, kept, #out)
            valueCache, valueCacheN = keep, kept
        end

        list, listAt = out, now
        stats.scans = stats.scans + 1
        stats.lastScanMs = (os.clock() - t0) * 1000
        stats.lastConsidered = considered
        stats.lastKept = #out

        log.trace("scan: %d records -> %d takeable (%d dupes) in %.1fms, best %s %s/s",
            considered, #out, dupes, stats.lastScanMs,
            out[1] and out[1].name or "-",
            out[1] and string.format("%.0f", out[1].value) or "-")

        return list
    end

    function M.best(opts)
        local l = M.list(opts)
        return l and l[1] or nil
    end

    function M.get(uid)
        if not uid then return nil end
        local rec
        BX.try("eggs.get", function()
            rec = EggState and EggState.ReadFieldEgg and EggState.ReadFieldEgg(uid)
        end)
        if not rec then return nil end
        return {
            uid   = tostring(uid),
            state = rec.State,
            pos   = rec.BoundsCFrame and rec.BoundsCFrame.Position,
            value = calcValue(rec),
            name  = displayName(rec),
            rarity = rarityOf(rec),
            rarityId = rarityIdOf(rec),
            assetCategory = rec.AssetCategory,
            assetScale = rec.AssetScale,
            mutations = rec.Mutations,
            kg    = weightOf(rec),
            areaId = rec.AreaId,
            nestId = rec.NestId,
        }
    end

    function M.carryingUid()
        local found
        BX.try("eggs.carryingUid", function()
            local data = EggState and EggState.ReadFieldEggs and EggState.ReadFieldEggs()
            for _, r in pairs(data and data.Records or {}) do
                if r.State == "Carried" then
                    found = tostring(r.Uid)
                    break
                end
            end
        end)
        return found
    end

    function M.stillTakeable(uid, states)
        local r = M.get(uid)
        if not r then return false, "gone" end
        local ok = (states or { Slot = true, Dropped = true })[r.state]
        return ok and true or false, r.state
    end

    function M.stats()
        local s = table.clone(stats)
        s.listSize = list and #list or 0
        s.valueCache = valueCacheN
        s.sawFullField = sawFullField
        return s
    end

    local WATCH = {
        "CarryChanged",      
        "FieldShifted",      
        "FieldRefreshed",    
        "FieldGone",         
        "FieldClaimed",      
        "SnapshotRefreshed", 
    }

    local sc = BX.scope("features.eggs")
    local watched = 0
    if EggState then
        for _, name in ipairs(WATCH) do
            BX.try("eggs.watch." .. name, function()
                local sig = EggState[name]
                if sig and type(sig) == "table" and type(sig.Connect) == "function" then
                    sc:connect(sig, function() M.markDirty(name) end)
                    watched = watched + 1
                end
            end)
        end
    end
    log.info("watching %d/%d EggState signals", watched, #WATCH)

    BX.require("core.character").onSpawn(sc, "eggs.respawn", function()
        M.invalidate("respawn")
    end)

    return M
end)

BX.module("features.grab", function(BX)
    local svc  = BX.require("core.services")
    local data = BX.require("core.data")
    local exec = BX.require("core.exec")
    local ch   = BX.require("core.character")
    local dev  = BX.require("core.device")
    local eggs = BX.require("features.eggs")
    local log  = BX.require("boot.log").for_module("grab")

    local RunService = svc.RunService
    local M = {}

    local K = {
        PROMPT_CACHE   = 30,    
        PROMPT_NEAR    = 14,    
        PROMPT_WAIT    = 0.6,   
        STEP_INSIDE    = 3,     
        CONFIRM_WINDOW = 1.2,   
        TRIES          = 3,
        RETRY_GAP      = 0.15,  
        TP_PROMPT_WAIT = 1.2,   
    }
    M.K = K

    local EggState = data.eggState()

    local prompts, promptsAt = nil, 0

    BX.profile.watch("grab.prompts", function() return prompts and #prompts or 0 end)

    local function promptList()
        local now = os.clock()
        if prompts and (now - promptsAt) < K.PROMPT_CACHE then
            return prompts
        end
        local t0 = os.clock()
        local found = {}
        for _, d in ipairs(workspace:GetDescendants()) do
            if d:IsA("ProximityPrompt") then
                local txt = string.lower(tostring(d.ActionText) .. " "
                    .. tostring(d.ObjectText) .. " " .. d.Name)
                if txt:find("steal") or txt:find("carry") then
                    found[#found + 1] = d
                end
            end
        end
        prompts, promptsAt = found, now
        log.trace("prompt cache rebuilt: %d prompts in %.1fms", #found, (os.clock() - t0) * 1000)
        return prompts
    end

    local function promptPos(p)
        local parent = p.Parent
        if not parent then return nil end
        if parent:IsA("BasePart") then return parent.Position end
        if parent:IsA("Model") then return parent:GetPivot().Position end
        return nil
    end

    function M.waitForPrompt(targetPos, cancel, seconds)
        if typeof(targetPos) ~= "Vector3" then return false end
        local listed = promptList()
        local t0 = os.clock()
        local until_ = t0 + dev.scale(seconds or K.TP_PROMPT_WAIT)
        repeat
            if cancel and cancel() then return false end
            for _, d in ipairs(listed) do
                if d.Parent and d.Enabled then
                    local pos = promptPos(d)
                    if pos and (pos - targetPos).Magnitude <= K.PROMPT_NEAR then
                        log.trace("prompt arrived after %.2fs", os.clock() - t0)
                        return true
                    end
                end
            end
            task.wait(0.05)
        until os.clock() > until_
        log.trace("prompt never showed after %.2fs", os.clock() - t0)
        return false
    end

    function M.confirm(uid, baseWalkSpeed, carrySignal)
        if carrySignal then return true, "CarryChanged" end

        local hum = ch.humanoid()
        if hum and baseWalkSpeed and hum.WalkSpeed and hum.WalkSpeed < (baseWalkSpeed - 1) then
            return true, "walkspeed drop"
        end

        local char = ch.get()
        if char then
            for _, c in ipairs(char:GetChildren()) do
                if c:IsA("Tool") and c:GetAttribute("ItemType") == "AssetEgg"
                   and tostring(c:GetAttribute("UID")) == tostring(uid) then
                    return true, "egg tool in hand"
                end
            end
        end

        local rec = eggs.get(uid)
        if rec and rec.state == "Carried" then return true, "ReadFieldEgg" end

        local any
        BX.try("grab.confirmAll", function()
            local data = EggState and EggState.ReadFieldEggs and EggState.ReadFieldEggs()
            for _, r in pairs(data and data.Records or {}) do
                if r.State == "Carried" and tostring(r.Uid) == tostring(uid) then
                    any = true
                    break
                end
            end
        end)
        if any then return true, "ReadFieldEggs" end

        return false, rec and rec.state or "unknown"
    end

    local function fireAt(targetPos, cancel)
        if not exec.can.prompts then
            return false, "executor has no fireproximityprompt"
        end
        local hrp = ch.root()
        if not hrp then return false, "no root" end

        local listed = promptList()

        if typeof(targetPos) == "Vector3" then
            M.waitForPrompt(targetPos, cancel, K.PROMPT_WAIT)
            if cancel and cancel() then return false, "cancelled" end
        end

        local best, bestDist = nil, math.huge
        for _, d in ipairs(listed) do
            
            if d.Parent and d.Enabled then
                local pos = promptPos(d)
                if pos then

                    local onTarget = (typeof(targetPos) ~= "Vector3")
                        or ((pos - targetPos).Magnitude <= K.PROMPT_NEAR)
                    local dist = (hrp.Position - pos).Magnitude
                    if onTarget and dist <= (d.MaxActivationDistance + 8) and dist < bestDist then
                        best, bestDist = d, dist
                    end
                end
            end
        end

        if not best then return false, "no prompt for this egg" end

        local pos = promptPos(best)
        local limit = (best.MaxActivationDistance or 8) - K.STEP_INSIDE
        if pos and bestDist > limit then
            local from = hrp.Position
            local step = pos - from
            local want = pos - (step.Magnitude > 0.1 and step.Unit or Vector3.new(0, 0, 1))
                * math.max(limit * 0.5, 2)
            pcall(function()
                hrp.CFrame = CFrame.new(Vector3.new(want.X, from.Y, want.Z))
                hrp.AssemblyLinearVelocity = Vector3.zero
            end)
            RunService.Heartbeat:Wait()
            local h2 = ch.root()
            if h2 then bestDist = (h2.Position - pos).Magnitude end
        end

        local wasHold, wasLoS = best.HoldDuration, best.RequiresLineOfSight
        pcall(function()
            best.HoldDuration = 0
            best.RequiresLineOfSight = false
        end)
        local fired = exec.firePrompt(best, 0)
        if fired then exec.firePrompt(best) end
        pcall(function()
            best.HoldDuration = wasHold
            best.RequiresLineOfSight = wasLoS
        end)

        return fired and true or false,
            fired and ("fired at %.1f studs"):format(bestDist)
            or "fireproximityprompt failed",
            bestDist
    end

    local stats = { attempts = 0, taken = 0, failed = 0, cancelled = 0 }
    function M.stats() return table.clone(stats) end

    function M.take(uid, opts)
        opts = opts or {}
        local cancel = opts.cancel
        local tries  = opts.tries or K.TRIES
        local targetPos = opts.pos

        stats.attempts = stats.attempts + 1
        local t0 = os.clock()

        local hum0 = ch.humanoid()
        local baseWS = (hum0 and hum0.WalkSpeed and hum0.WalkSpeed > 0) and hum0.WalkSpeed or nil

        local sc = BX.scope("features.grab.attempt")
        local carrySignal = false
        if EggState and EggState.CarryChanged then
            BX.try("grab.watchCarry", function()
                sc:connect(EggState.CarryChanged, function(info)
                    if type(info) ~= "table" or info.Uid == nil
                       or tostring(info.Uid) == tostring(uid) then
                        carrySignal = true
                    end
                end)
            end)
        end

        local function finish(ok, reason, attempt, fireDist)
            sc:destroy()
            local ms = (os.clock() - t0) * 1000
            if ok then
                stats.taken = stats.taken + 1
                eggs.markStolen(uid)
            elseif reason == "cancelled" then
                stats.cancelled = stats.cancelled + 1
            else
                stats.failed = stats.failed + 1
            end

            local level = ok and log.info or log.warn
            level("%s uid=%s after %d/%d tries in %.0fms (witness=%s dist=%s tier=%s)",
                ok and "TAKEN" or ("FAILED: " .. tostring(reason)),
                tostring(uid), attempt or 0, tries, ms, tostring(reason),
                fireDist and string.format("%.1f", fireDist) or "-", dev.tier)
            return ok, {
                reason = reason, attempts = attempt or 0,
                ms = ms, distance = fireDist,
            }
        end

        local have, witness = M.confirm(uid, baseWS, carrySignal)
        if have then return finish(true, witness, 0) end

        for attempt = 1, tries do
            if cancel and cancel() then return finish(false, "cancelled", attempt) end
            if not ch.root() then return finish(false, "no character", attempt) end

            local ok, state = eggs.stillTakeable(uid)
            if not ok and not carrySignal then
                return finish(false, "egg " .. tostring(state), attempt)
            end

            local fired, why, dist = fireAt(targetPos, cancel)
            if why == "cancelled" then return finish(false, "cancelled", attempt) end

            if fired then

                local until_ = os.clock() + dev.scale(K.CONFIRM_WINDOW)
                repeat
                    if cancel and cancel() then return finish(false, "cancelled", attempt, dist) end
                    local got, w = M.confirm(uid, baseWS, carrySignal)
                    if got then return finish(true, w, attempt, dist) end
                    RunService.Heartbeat:Wait()
                until os.clock() > until_
            end

            if attempt < tries then task.wait(dev.scale(K.RETRY_GAP)) end
        end

        local got, w = M.confirm(uid, baseWS, carrySignal)
        if got then return finish(true, w, tries) end
        return finish(false, "no confirmation", tries)
    end

    function M.warmPrompts()
        local t0 = os.clock()
        local n = #promptList()
        return (os.clock() - t0) * 1000, n
    end

    function M.clearCache()
        prompts, promptsAt = nil, 0
    end

    return M
end)

BX.module("features.instant", function(BX)
    local svc  = BX.require("core.services")
    local data = BX.require("core.data")
    local ch   = BX.require("core.character")
    local dev  = BX.require("core.device")
    local eggs  = BX.require("features.eggs")
    local guard = BX.require("features.guard")
    local log  = BX.require("boot.log").for_module("instant")

    local RunService = svc.RunService
    local M = {}

    local K = {
        TIMEOUT       = 3,     

        RACE_THREADS  = 3,     
        RACE_STAGGER  = 0.05,  
        LIFT          = 2,     

        PULLBACK_GAP  = 25,

        FREE_CALLS    = 12,    
        SAME_MSG_GAP  = 0.12,  
        SAME_MSG_STOP = 30,    
    }
    M.K = K

    local EggState, SlotIdentity = data.eggState(), data.slotIdentity()

    local function ensureModules()
        if not EggState then EggState = data.eggState() end
        if not SlotIdentity then SlotIdentity = data.slotIdentity() end
        M.ready = (EggState ~= nil and type(EggState.CarryFieldEgg) == "function")
        return M.ready
    end
    ensureModules()
    if not M.ready then
        log.warn("EggState.CarryFieldEgg unavailable - instant steal disabled until it resolves")
    end

    local holdGen = 0
    local stats = { runs = 0, won = 0, lost = 0, cancelled = 0, calls = 0 }
    function M.stats() return table.clone(stats) end

    local function slotKeyFor(uid, areaId, nestId)
        local key = nil
        BX.try("instant.slotKey", function()
            if SlotIdentity and SlotIdentity.LooksLikeFirstAreaUid
               and SlotIdentity.LooksLikeFirstAreaUid(uid) then
                key = SlotIdentity.SlotKey(areaId, nestId)
            end
        end)
        return key
    end

    function M.take(uid, eggPos, opts)
        opts = opts or {}
        local cancel = opts.cancel or function() return false end
        if not M.ready and not ensureModules() then return false, { reason = "no CarryFieldEgg" } end
        if typeof(eggPos) ~= "Vector3" then return false, { reason = "no egg position" } end

        local char = ch.get()
        if not char then return false, { reason = "no character" } end

        stats.runs = stats.runs + 1
        local t0 = os.clock()

        local target = CFrame.new(eggPos.X, eggPos.Y + K.LIFT, eggPos.Z)
        local slotKey = slotKeyFor(uid, opts.areaId, opts.nestId)

        local deadline = os.clock() + dev.scale(opts.timeout or K.TIMEOUT)

        local sc = BX.scope("features.instant.race")
        holdGen = holdGen + 1
        local myGen = holdGen
        local won, tries, lastMsg = false, 0, nil
        local sameMsg, sameCount = nil, 0
        local bailed = false

        BX.profile.mark("target_tp")

        sc:spawn("hold", function()
            while not won and holdGen == myGen and os.clock() < deadline and sc:alive() do
                local c = ch.get()
                if c then pcall(function() c:PivotTo(target) end) end
                local h = ch.root()
                if h then
                    h.AssemblyLinearVelocity = Vector3.zero
                    h.AssemblyAngularVelocity = Vector3.zero
                end
                RunService.Heartbeat:Wait()
            end
        end)

        local heldFor = guard.waitForServerRelease(cancel)
        if cancel() then
            holdGen = holdGen + 1
            sc:destroy()
            stats.cancelled = stats.cancelled + 1
            return false, { reason = "cancelled", ms = (os.clock() - t0) * 1000 }
        end

        for i = 1, K.RACE_THREADS do
            sc:spawn("invoke" .. i, function()
                task.wait((i - 1) * K.RACE_STAGGER)
                while not won and not bailed and os.clock() < deadline and sc:alive() do
                    if cancel() then return end
                    tries = tries + 1
                    stats.calls = stats.calls + 1
                    local ok, res, msg = pcall(function()
                        return EggState.CarryFieldEgg(uid, slotKey)
                    end)
                    if msg ~= nil then lastMsg = tostring(msg) end

                    if type(msg) == "string" and msg:lower():find("downed") then
                        local left = guard.ragdollRemaining()
                        if left > 0 then task.wait(math.min(left, 0.25)) end
                    end

                    if not won and type(msg) == "string" then
                        if msg == sameMsg then
                            sameCount = sameCount + 1
                        else
                            sameMsg, sameCount = msg, 1
                        end
                        if sameCount >= K.SAME_MSG_STOP then
                            bailed = true
                            return
                        end
                        if tries > K.FREE_CALLS and sameCount > 1 then
                            task.wait(K.SAME_MSG_GAP)
                        end
                    end

                    if ok and res == true and not won then
                        won = true
                        return
                    end
                    if won then return end

                    RunService.Heartbeat:Wait()
                end
            end)
        end

        local cancelled = false
        while not won and not bailed and os.clock() < deadline do
            if cancel() then cancelled = true break end
            RunService.Heartbeat:Wait()
        end

        holdGen = holdGen + 1
        sc:destroy()

        local ms = (os.clock() - t0) * 1000
        local gap = (function()
            local h = ch.root()
            return h and (h.Position - eggPos).Magnitude or -1
        end)()

        if cancelled then
            stats.cancelled = stats.cancelled + 1
            log.info("cancelled after %d calls in %.0fms", tries, ms)
            return false, { reason = "cancelled", calls = tries, ms = ms }
        end

        BX.profile.mark(won and "target_landed" or "target_lost")

        if won then
            stats.won = stats.won + 1
            eggs.markStolen(uid)
            log.info("WON uid=%s after %d calls in %.0fms (%d threads, gap %.1f, tier=%s)",
                tostring(uid), tries, ms, K.RACE_THREADS, gap, dev.tier)
            return true, { reason = "instant", calls = tries, ms = ms,
                           gap = gap, heldFor = heldFor }
        end

        stats.lost = stats.lost + 1

        local rec = eggs.get(uid)
        local pulledBack = gap > K.PULLBACK_GAP
        local diag = ("localGap=%.1f eggState=%s eggMoved=%s pulledBack=%s%s"):format(
            gap,
            rec and tostring(rec.state) or "gone",
            rec and rec.pos and tostring((rec.pos - eggPos).Magnitude > 5) or "?",
            tostring(pulledBack),
            bailed and (" bailed after %d identical refusals"):format(sameCount) or "")

        log.warn("LOST uid=%s after %d calls in %.0fms (%s, last: %s, tier=%s)",
            tostring(uid), tries, ms, diag, tostring(lastMsg), dev.tier)

        return false, {
            reason = lastMsg or "no accept",
            calls = tries, ms = ms, gap = gap,
            pulledBack = pulledBack,
            eggState = rec and rec.state or "gone",
            eggGone = rec == nil,
            heldFor = heldFor,
        }
    end

    return M
end)

BX.module("features.plot", function(BX)
    local svc = BX.require("core.services")
    local data = BX.require("core.data")
    local log = BX.require("boot.log").for_module("plot")

    local M = {}

    local K = {
        HOME_TTL = 30,      
        ARRIVE   = 18,      
    }
    M.K = K

    local PlotState = data.plotState()

    local cached, cachedAt, cachedVia = nil, 0, nil

    local function resolve()
        local pos, via

        if PlotState then
            BX.try("plot.findRespawn", function()
                local cf = PlotState.FindRespawnCFrame and PlotState.FindRespawnCFrame()
                if typeof(cf) == "CFrame" then pos, via = cf.Position, "PlotState.FindRespawnCFrame" end
            end)
        end

        if not pos and PlotState then
            BX.try("plot.resolveSlot", function()
                local slot = PlotState.ResolveLocalSlot and PlotState.ResolveLocalSlot()
                local plots = slot and workspace:FindFirstChild("Plots")
                local mine = plots and plots:FindFirstChild(tostring(slot))
                if mine then
                    local cf = mine:GetPivot()
                    if typeof(cf) == "CFrame" then pos, via = cf.Position, "plot " .. tostring(slot) end
                end
            end)
        end

        if not pos then
            BX.try("plot.spawnLocation", function()
                local sl = workspace:FindFirstChildOfClass("SpawnLocation")
                if sl and sl:IsA("BasePart") then
                    pos, via = sl.Position + Vector3.new(0, 4, 0), "SpawnLocation"
                end
            end)
        end

        if not pos then
            BX.try("plot.spawnTarget", function()
                local st = workspace:FindFirstChild("SpawnTarget", true)
                if st and st:IsA("BasePart") then
                    pos, via = st.Position + Vector3.new(0, 4, 0), "SpawnTarget"
                end
            end)
        end

        return pos, via
    end

    function M.home()
        local now = os.clock()
        if cached and (now - cachedAt) < K.HOME_TTL then
            return cached, cachedVia
        end
        local pos, via = resolve()
        if not pos then
            
            log.error("cannot resolve this player's plot - refusing to deliver "
                .. "(PlotState=%s)", tostring(PlotState ~= nil))
            return nil, "no plot resolved"
        end
        if via ~= cachedVia then
            log.info("home resolved via %s at %s", via, tostring(pos))
        end
        cached, cachedAt, cachedVia = pos, now, via
        return cached, cachedVia
    end

    function M.forget()
        cached, cachedAt = nil, 0
    end

    local szCache, szAt, szVia = nil, 0, nil

    function M.safeZone()
        local now = os.clock()
        if szCache and (now - szAt) < K.HOME_TTL then
            return szCache, szVia
        end

        local pos, via

        BX.try("plot.spawnLocationZone", function()
            local sl = workspace:FindFirstChildOfClass("SpawnLocation")
            if sl and sl:IsA("BasePart") then
                pos, via = sl.Position + Vector3.new(0, 4, 0), "SpawnLocation"
            end
        end)

        if not pos then
            BX.try("plot.spawnTargetZone", function()
                local st = workspace:FindFirstChild("SpawnTarget", true)
                if st and st:IsA("BasePart") then
                    pos, via = st.Position + Vector3.new(0, 4, 0), "SpawnTarget"
                end
            end)
        end

        if not pos then

            local p, pvia = M.home()
            if p then pos, via = p, "plot fallback (" .. tostring(pvia) .. ")" end
        end

        if not pos then
            log.error("cannot resolve a safe zone - refusing to deliver")
            return nil, "unresolved"
        end

        if via ~= szVia then
            log.info("safe zone resolved via %s at %s", via, tostring(pos))
        end
        szCache, szAt, szVia = pos, now, via
        return szCache, szVia
    end

    function M.forgetSafeZone()
        szCache, szAt = nil, 0
    end

    local lastClaimAt, lastClaimName = 0, nil
    local listeners = {}

    function M.claimedSince(t)
        return lastClaimAt > (t or 0), lastClaimName
    end

    function M.onClaim(sc, label, fn)
        listeners[#listeners + 1] = { scope = sc, label = label, fn = fn }
    end

    local sc = BX.scope("features.plot")
    local EggState
    BX.try("plot.resolveEggState", function()
        local found = svc.ReplicatedStorage:FindFirstChild("EggState", true)
        if found and found:IsA("ModuleScript") then EggState = require(found) end
    end)

    if EggState and EggState.FieldClaimed then
        BX.try("plot.armClaimWatch", function()
            sc:connect(EggState.FieldClaimed, function(info)
                lastClaimAt = os.clock()
                lastClaimName = (type(info) == "table"
                    and (info.DisplayName or info.AssetCategory)) or "egg"
                log.info("CLAIM: server claimed our egg -> %s", tostring(lastClaimName))
                for i = #listeners, 1, -1 do
                    local L = listeners[i]
                    if not L.scope or L.scope.dead then
                        table.remove(listeners, i)
                    else
                        BX.try("plot/" .. L.label, L.fn, lastClaimName)
                    end
                end
            end)
        end)
    else
        log.warn("EggState.FieldClaimed unavailable - deliveries cannot be confirmed")
    end

    M._listeners = function() return #listeners end
    return M
end)

BX.module("features.regrab", function(BX)
    local svc     = BX.require("core.services")
    local eggs    = BX.require("features.eggs")
    local instant = BX.require("features.instant")
    local guard   = BX.require("features.guard")
    local ch      = BX.require("core.character")
    local dev     = BX.require("core.device")
    local log     = BX.require("boot.log").for_module("regrab")

    local RunService = svc.RunService
    local M = {}

    local K = {
        SETTLE      = 0.08,   
        WAIT        = 8.0,    
        POLL        = 0.05,
        TRIES       = 4,      
        MAX_PER_STEAL = 2,    
    }
    M.K = K

    local stats = { runs = 0, recovered = 0, banked = 0, gone = 0, failed = 0, cancelled = 0 }
    function M.stats() return table.clone(stats) end

    local function settledPos(uid)
        local r = eggs.get(uid)
        if not r then return nil, nil end
        return r.pos, r.state
    end

    function M.recover(uid, opts)
        opts = opts or {}
        local cancel = opts.cancel or function() return false end
        stats.runs = stats.runs + 1
        local t0 = os.clock()

        task.wait(K.SETTLE)
        if cancel() then
            stats.cancelled = stats.cancelled + 1
            return false, { reason = "cancelled", recovery = "cancelled" }
        end

        local heldFor = guard.waitForServerRelease(cancel)
        if cancel() then
            stats.cancelled = stats.cancelled + 1
            return false, { reason = "cancelled", recovery = "cancelled" }
        end

        local deadline = os.clock() + dev.scale(K.WAIT)
        local pos, state, said
        repeat
            if cancel() then
                stats.cancelled = stats.cancelled + 1
                return false, { reason = "cancelled", recovery = "cancelled" }
            end
            pos, state = settledPos(uid)
            if state == "Claimed" then
                
                stats.banked = stats.banked + 1
                log.info("drop_recovery=banked uid=%s (the egg was claimed)", tostring(uid))
                return false, { reason = "claimed", recovery = "banked" }
            end
            if state == nil then
                stats.gone = stats.gone + 1
                log.warn("drop_recovery=failed uid=%s (record gone)", tostring(uid))
                return false, { reason = "gone", recovery = "failed" }
            end
            if state == "Slot" or state == "Dropped" then break end
            if state ~= said then
                said = state
                log.trace("egg is %s - waiting for it to settle", tostring(state))
            end
            task.wait(K.POLL)
        until os.clock() > deadline

        if state ~= "Slot" and state ~= "Dropped" then
            stats.failed = stats.failed + 1
            log.warn("drop_recovery=failed uid=%s (still %s after %.1fs)",
                tostring(uid), tostring(state), os.clock() - t0)
            return false, { reason = "never settled (" .. tostring(state) .. ")",
                            recovery = "failed" }
        end

        for attempt = 1, K.TRIES do
            if cancel() then
                stats.cancelled = stats.cancelled + 1
                return false, { reason = "cancelled", recovery = "cancelled" }
            end

            local pNow, sNow = settledPos(uid)
            if sNow == "Claimed" then
                stats.banked = stats.banked + 1
                log.info("drop_recovery=banked uid=%s (claimed on the way)", tostring(uid))
                return false, { reason = "claimed", recovery = "banked" }
            end
            if not pNow then
                stats.gone = stats.gone + 1
                log.warn("drop_recovery=failed uid=%s (record gone on the way)", tostring(uid))
                return false, { reason = "gone", recovery = "failed" }
            end

            local hrp = ch.root()
            local gapBefore = hrp and (pNow - hrp.Position).Magnitude or -1

            local got, info = instant.take(uid, pNow, {
                cancel = cancel,
                areaId = opts.areaId, nestId = opts.nestId,
            })

            if got then
                stats.recovered = stats.recovered + 1
                log.info("drop_recovery=tp uid=%s attempt %d/%d in %.2fs "
                    .. "(was %.0f studs out, %d calls)",
                    tostring(uid), attempt, K.TRIES, os.clock() - t0,
                    gapBefore, info and info.calls or -1)
                return true, { recovery = "tp", attempts = attempt,
                               ms = (os.clock() - t0) * 1000 }
            end

            if info and info.pulledBack then
                log.warn("drop_recovery=tp_refused uid=%s attempt %d/%d "
                    .. "(landed %.0f studs off, reason=%s)",
                    tostring(uid), attempt, K.TRIES,
                    info.gap or -1, tostring(info.reason))
            else
                log.trace("attempt %d/%d: %s (egg %s, %.0f studs)",
                    attempt, K.TRIES, tostring(info and info.reason),
                    tostring(sNow), gapBefore)
            end

            task.wait(dev.scale(K.POLL))
        end

        stats.failed = stats.failed + 1
        log.warn("drop_recovery=failed uid=%s after %d attempts in %.2fs",
            tostring(uid), K.TRIES, os.clock() - t0)
        return false, { reason = "no regrab", recovery = "failed" }
    end

    return M
end)

BX.module("features.carry", function(BX)
    local svc  = BX.require("core.services")
    local move = BX.require("features.movement")
    local plot = BX.require("features.plot")
    local eggs = BX.require("features.eggs")
    local ch   = BX.require("core.character")
    local dev  = BX.require("core.device")
    local log  = BX.require("boot.log").for_module("carry")

    local M = {}

    local K = {
        SPEED      = 500,   
        ARRIVE     = 5,     
        CLAIM_WAIT = 6,     
    }
    M.K = K

    local stats = { runs = 0, delivered = 0, failed = 0, cancelled = 0, lost = 0 }
    function M.stats() return table.clone(stats) end

    local function holding(uid)
        local r = eggs.get(uid)
        if not r then return false, "gone" end
        return r.state == "Carried", r.state
    end

    function M.home(uid, opts)
        opts = opts or {}
        local outerCancel = opts.cancel
        stats.runs = stats.runs + 1

        local t0 = os.clock()
        local stages = {}
        local function stage(name, fn)
            local s0 = os.clock()
            local ok, info = fn()
            stages[#stages + 1] = {
                name = name, ms = (os.clock() - s0) * 1000, ok = ok and true or false,
            }
            return ok, info
        end

        local function report()
            local parts = {}
            for _, s in ipairs(stages) do
                parts[#parts + 1] = ("%s=%.0fms%s"):format(s.name, s.ms, s.ok and "" or "!")
            end
            return table.concat(parts, " ")
        end

        local function fail(why)
            stats.failed = stats.failed + 1
            log.warn("FAILED %s uid=%s after %.2fs [%s] tier=%s",
                why, tostring(uid), os.clock() - t0, report(), dev.tier)
            return false, { reason = why, stages = stages, elapsed = os.clock() - t0 }
        end

        local dest, via = plot.safeZone()
        if not dest then return fail("no safe zone resolved") end

        if not ch.root() then return fail("no character") end

        local lastCheck, lastHeld = 0, true
        local function carryCancel()
            if outerCancel and outerCancel() then return true end
            local now = os.clock()
            if (now - lastCheck) >= 0.25 then
                lastCheck = now
                lastHeld = holding(uid)
            end
            return not lastHeld
        end

        local before = ch.root().Position
        local distance = (Vector3.new(dest.X, 0, dest.Z)
            - Vector3.new(before.X, 0, before.Z)).Magnitude

        log.info("carrying %s to the safe zone via %s (%.0f studs, tier=%s)",
            tostring(uid), tostring(via), distance, dev.tier)

        local arrived, moveInfo = stage("arc", function()
            return move.travel{
                to = dest, speed = K.SPEED, arrive = K.ARRIVE,
                carrying = true, cancel = carryCancel, tag = "carry home",
            }
        end)

        local stillOurs, state = holding(uid)
        if not stillOurs then
            stats.lost = stats.lost + 1
            local gone = ch.root()
            local travelled = gone and (gone.Position - before).Magnitude or -1
            
            log.warn("carry ended mid-route: egg is %s after %.0f/%.0f studs (%.2fs)",
                tostring(state), travelled, distance, os.clock() - t0)
            return false, {
                reason = "dropped in transit (" .. tostring(state) .. ")",
                stages = stages, droppedAt = travelled, distance = distance,
            }
        end

        if outerCancel and outerCancel() then
            stats.cancelled = stats.cancelled + 1
            return false, { reason = "cancelled", stages = stages }
        end
        if not arrived then
            return fail("could not reach the safe zone ("
                .. tostring(moveInfo and moveInfo.reason) .. ")")
        end

        stage("descend", function()
            return move.descend("deliver"), nil
        end)

        local claimFrom = os.clock()
        local claimed = stage("claim", function()
            local until_ = os.clock() + dev.scale(K.CLAIM_WAIT)
            repeat
                if outerCancel and outerCancel() then return false, { reason = "cancelled" } end
                local got = plot.claimedSince(claimFrom)
                if got then return true, { reason = "claimed" } end
                svc.RunService.Heartbeat:Wait()
            until os.clock() > until_
            return false, { reason = "no claim" }
        end)

        if not claimed then

            local have, st = holding(uid)
            return fail(have and "arrived but never claimed"
                or ("lost at the door (" .. tostring(st) .. ")"))
        end

        stats.delivered = stats.delivered + 1
        log.info("DELIVERED uid=%s in %.2fs via %s [%s] tier=%s",
            tostring(uid), os.clock() - t0, tostring(via), report(), dev.tier)
        return true, { reason = "delivered", stages = stages, elapsed = os.clock() - t0 }
    end

    return M
end)

BX.module("features.bait", function(BX)
    local svc  = BX.require("core.services")
    local data = BX.require("core.data")
    local move = BX.require("features.movement")
    local ch   = BX.require("core.character")
    local dev  = BX.require("core.device")
    local log  = BX.require("boot.log").for_module("bait")

    local RunService = svc.RunService
    local M = {}

    local K = {
        AREA_WAIT    = 5,     
        APPROACH     = 1200,  
        ARRIVE       = 4,
        PICKUP_WAIT  = 3,     
        REHOPS       = 2,     
        HIT_WAIT     = 4.0,   
        WITNESS_HOLD = 0.35,  
    }
    M.K = K

    local EggState, SlotIdentity = data.eggState(), data.slotIdentity()

    local areaCached = nil

    function M.firstAreaId(waitFor)
        if areaCached then return areaCached end

        if waitFor then
            local deadline = os.clock() + waitFor
            while os.clock() < deadline do
                local there = false
                pcall(function()
                    there = workspace.__OBJECTS.Areas.GuardAreas:GetChildren()[1] ~= nil
                end)
                if there then break end
                task.wait(0.2)
            end
        end

        local best, bestX
        BX.try("bait.resolveArea", function()
            for _, a in ipairs(workspace.__OBJECTS.Areas.GuardAreas:GetChildren()) do
                local b = a:FindFirstChild("Bounds")
                if b and b:IsA("BasePart") then
                    local x = b.Position.X - b.Size.X * 0.5
                    if not best or x < bestX then best, bestX = a.Name, x end
                end
            end
        end)
        if best then
            areaCached = best
            log.info("first area resolved: %s (leftmost at x=%.0f)", best, bestX)
        else
            log.warn("guard areas have not streamed in - no bait area")
        end
        return areaCached
    end

    local function findGuard(areaId)
        if not areaId then return nil end
        local live = workspace:FindFirstChild("_Guards")
        if live then
            for _, g in ipairs(live:GetChildren()) do
                if g.Name == areaId or g:GetAttribute("AreaId") == areaId then return g end
            end
        end
        local a
        pcall(function() a = workspace.__OBJECTS.Areas.GuardAreas[areaId] end)
        return a and a:FindFirstChild("Guard") or nil
    end

    local function guardPart(guard)
        if not guard then return nil end
        local root = guard:FindFirstChild("HumanoidRootPart")
            or guard:FindFirstChild("Collider")
            or guard:FindFirstChild("Head")
        if root and root:IsA("BasePart") then return root end
        local best
        for _, d in ipairs(guard:GetDescendants()) do
            if d:IsA("BasePart") then
                local v = d.Size.X * d.Size.Y * d.Size.Z
                if not best or v > best.v then best = { p = d, v = v } end
            end
        end
        return best and best.p or nil
    end

    local stats = { runs = 0, hits = 0, noEgg = 0, noPickup = 0, noHit = 0, cancelled = 0 }
    function M.stats() return table.clone(stats) end

    function M.prime(opts)
        opts = opts or {}
        local cancel = opts.cancel
        stats.runs = stats.runs + 1
        local t0 = os.clock()

        local areaId = M.firstAreaId(K.AREA_WAIT)
        if not areaId then
            return false, { reason = "no bait area" }
        end

        if not EggState then EggState = data.eggState() SlotIdentity = SlotIdentity or data.slotIdentity() end
        if not EggState then
            stats.noEgg = stats.noEgg + 1
            return false, { reason = "no EggState on this executor" }
        end

        local rec
        BX.try("bait.findEgg", function()
            for _, r in pairs(EggState.ReadFieldEggs().Records) do
                if r.AreaId == areaId and r.State == "Slot" and r.BoundsCFrame then
                    rec = r
                    break
                end
            end
        end)
        if not rec then
            stats.noEgg = stats.noEgg + 1
            log.trace("no egg available in %s", tostring(areaId))
            return false, { reason = "no bait egg" }
        end

        local pos = rec.BoundsCFrame.Position

        local movedAt = os.clock()
        move.travel{ to = pos, speed = K.APPROACH, arrive = K.ARRIVE,
                     carrying = false, cancel = cancel, tag = "bait approach" }
        if cancel and cancel() then
            stats.cancelled = stats.cancelled + 1
            return false, { reason = "cancelled" }
        end

        local slotKey = nil
        BX.try("bait.slotKey", function()
            if SlotIdentity and SlotIdentity.LooksLikeFirstAreaUid
               and SlotIdentity.LooksLikeFirstAreaUid(rec.Uid) then
                slotKey = SlotIdentity.SlotKey(rec.AreaId, rec.NestId)
            end
        end)

        local got = false
        local deadline = os.clock() + dev.scale(K.PICKUP_WAIT)
        local rehops, tries = 0, 0
        local startPos = ch.root() and ch.root().Position

        while os.clock() < deadline and not got do
            if cancel and cancel() then
                stats.cancelled = stats.cancelled + 1
                return false, { reason = "cancelled" }
            end
            local here = ch.root()
            if not here then return false, { reason = "no character" } end

            if startPos and (here.Position - pos).Magnitude > 60 and rehops < K.REHOPS then
                rehops = rehops + 1
                log.trace("server pulled us back - hopping again (%d/%d)", rehops, K.REHOPS)
                move.travel{ to = pos, speed = K.APPROACH, arrive = K.ARRIVE,
                             carrying = false, cancel = cancel, tag = "bait rehop" }
                deadline = os.clock() + dev.scale(K.PICKUP_WAIT)
            end

            tries = tries + 1
            local ok, res = pcall(function() return EggState.CarryFieldEgg(rec.Uid, slotKey) end)
            if ok and res == true then got = true break end
            RunService.Heartbeat:Wait()
        end

        if got then BX.profile.mark("bait_grab") end
        if not got then
            stats.noPickup = stats.noPickup + 1
            log.warn("could not pick up in %s after %d tries, %d rehops (%.2fs)",
                tostring(areaId), tries, rehops, os.clock() - t0)
            return false, { reason = "no pickup", tries = tries, rehops = rehops }
        end

        BX.profile.mark("guard_contact")
        local guard = findGuard(areaId)
        local gpart = guardPart(guard)
        if gpart then

            local hh = ch.root()
            local char = ch.get()
            if hh and char then
                local gy = move.groundY(gpart.Position) or hh.Position.Y
                pcall(function()
                    char:PivotTo(CFrame.new(gpart.Position.X, gy, gpart.Position.Z))
                end)
            end
        else
            log.warn("no guard found in %s", tostring(areaId))
        end

        local hrp = ch.root()
        local anchorCF = hrp and hrp.CFrame
        if hrp then pcall(function() hrp.Anchored = true end) end

        local hitAt, witnessAt = nil, nil
        local dl = os.clock() + dev.scale(K.HIT_WAIT)

        while os.clock() < dl do
            if cancel and cancel() then break end
            local hh = ch.root()
            if not hh then break end

            hh.AssemblyLinearVelocity = Vector3.zero
            hh.AssemblyAngularVelocity = Vector3.zero
            if anchorCF then pcall(function() hh.CFrame = anchorCF end) end

            local witnessed = false

            local hum = ch.humanoid()
            if hum and hum:GetState() == Enum.HumanoidStateType.Physics then
                witnessed = true   
            end
            if not witnessed then

                local okR, r = pcall(EggState.ReadFieldEgg, rec.Uid)
                local st = okR and type(r) == "table" and r.State or nil
                witnessed = (st == "Dropped" or st == "GuardCarried")
            end

            if witnessed and not witnessAt then
                witnessAt = os.clock()
                log.info("witness seen @%.3f (+%.3fs into the prime)",
                    witnessAt, witnessAt - t0)
            end

            if witnessAt and (os.clock() - witnessAt) >= K.WITNESS_HOLD then
                BX.profile.mark("hit_detected")
                hitAt = os.clock()
                log.info("HIT CONFIRMED @%.3f (+%.3fs into the prime, hold=%.3fs)",
                    hitAt, hitAt - t0, hitAt - witnessAt)
                break
            end
            RunService.Heartbeat:Wait()
        end

        do
            local hh = ch.root()
            if hh then pcall(function() hh.Anchored = false end) end
            BX.profile.mark("unanchor")
        end

        local took = hitAt ~= nil
        if took then stats.hits = stats.hits + 1 else stats.noHit = stats.noHit + 1 end

        log.info("%s in %s after %.2fs (tries=%d rehops=%d witness=%s tier=%s)",
            took and "HIT TAKEN" or "no hit", tostring(areaId), os.clock() - t0,
            tries, rehops, witnessAt and "yes" or "no", dev.tier)

        return took, {
            reason = took and "hit" or "no hit",
            areaId = areaId, tries = tries, rehops = rehops,
            elapsed = os.clock() - t0,
        }
    end

    return M
end)

BX.module("features.autosteal", function(BX)
    local svc   = BX.require("core.services")
    local dev   = BX.require("core.device")
    local ch    = BX.require("core.character")
    local st    = BX.require("core.state")
    local eggs  = BX.require("features.eggs")
    local grab  = BX.require("features.grab")
    local move  = BX.require("features.movement")
    local carry = BX.require("features.carry")
    local bait  = BX.require("features.bait")
    local plot  = BX.require("features.plot")
    local adeath = BX.require("features.antideath")
    local guard  = BX.require("features.guard")
    local rs     = BX.require("core.restore")
    local instant = BX.require("features.instant")
    local regrab = BX.require("features.regrab")
    local hswap  = BX.require("features.humanoid")
    local log   = BX.require("boot.log").for_module("autosteal")

    local M = {}

    local BACKOFF_BASE = 1.0
    local BACKOFF_CAP  = 8.0

    local IDLE_WAIT = 0.5

    M.STATE = {

        PREP_DELIVER_HELD = "PREP_DELIVER_HELD",
        READY_TO_STEAL    = "READY_TO_STEAL",
        BAIT_NOT_DONE     = "BAIT_NOT_DONE",
        BAIT_DONE         = "BAIT_DONE",
        AT_TARGET         = "AT_TARGET",
        TARGET_GRAB_RETRY = "TARGET_GRAB_RETRY",
        CARRYING          = "CARRYING",
        RETURNING         = "RETURNING",
        DELIVERED         = "DELIVERED",
    }

    local phases = {}
    local phaseRun = 0

    local function phase(token, name, detail)
        if token ~= phaseRun then
            phases, phaseRun = {}, token
        end
        phases[#phases + 1] = name
        log.info("run %d: phase %s%s", token, name,
            detail and (" (" .. tostring(detail) .. ")") or "")
    end

    function M.phases() return table.clone(phases) end

    local TARGET_RETRIES = 2

    local RESPAWN_WAIT = 12

    local stopListeners = {}

    function M.onStop(fn)
        stopListeners[#stopListeners + 1] = fn
    end

    local deliveredListeners = {}

    function M.onDelivered(fn)
        deliveredListeners[#deliveredListeners + 1] = fn
    end

    local function fireDelivered(target)
        if not target then return end
        for _, fn in ipairs(deliveredListeners) do
            task.spawn(function() BX.try("autosteal.onDelivered", fn, target) end)
        end
    end

    local runToken = 0
    local running  = false
    local cycles   = 0
    local sc       = nil
    local failures = 0

    local opts     = {}       
    local optsFor  = {}       
    local owner    = nil      

    local function snapshot()
        local h = BX.profile.health()
        local e = eggs.stats()
        return {
            scopes = h.scopes, conns = h.conns, insts = h.insts, threads = h.threads,
            eggList = e.listSize, eggValues = e.valueCache,
        }
    end

    local SNAP_KEYS = { "scopes", "conns", "insts", "threads", "eggList", "eggValues" }

    local function diff(a, b)
        local out = {}
        for _, k in ipairs(SNAP_KEYS) do
            local d = (b[k] or 0) - (a[k] or 0)
            if d ~= 0 then out[#out + 1] = ("%s %+d"):format(k, d) end
        end
        return #out > 0 and table.concat(out, " ") or "no change"
    end

    local function runCycle(token, cancel)
        local cycle = { t0 = os.clock(), stages = {} }
        BX.profile.mark("cycle_start")

        local function stage(name, fn)
            if cancel() then return false, { reason = "cancelled" } end
            local s0 = os.clock()
            local ok, info = fn()
            cycle.stages[#cycle.stages + 1] = {
                name = name, ms = (os.clock() - s0) * 1000, ok = ok and true or false,
            }
            return ok, info
        end

        local held = eggs.carryingUid()
        if held then

            local isObjective = (opts.uid ~= nil) and (held == opts.uid)
            cycle.prep = not isObjective
            cycle.state = isObjective and M.STATE.RETURNING
                or M.STATE.PREP_DELIVER_HELD
            phase(token, cycle.state, "holding " .. tostring(held))
            cycle.recovered = held
            log.info("already carrying %s - %s", held,
                isObjective and "this is the selected egg, delivering to finish"
                or "not the selected egg, clearing our hands first")
            local ok2, info2 = stage("carry held", function()
                return carry.home(held, { cancel = cancel })
            end)
            if ok2 then
                cycle.target = { name = isObjective and "selected egg" or "held egg",
                                 uid = held }
                if isObjective then
                    cycle.state = M.STATE.DELIVERED
                    cycle.terminal = true
                    phase(token, cycle.state, held)
                    return true, "delivered", cycle
                end
                
                cycle.state = M.STATE.READY_TO_STEAL
                cycle.terminal = false
                phase(token, cycle.state, "hands clear after prep")
                return true, "prep: held egg delivered", cycle
            end

            return false, "held egg: " .. tostring(info2 and info2.reason), cycle
        end

        if cycle.state == nil then
            cycle.state = M.STATE.READY_TO_STEAL
            phase(token, cycle.state)
        end

        local preTarget = nil
        if opts.pick and not opts.uid then
            local okPre, pre, whyPre = pcall(opts.pick)
            if not okPre then
                return false, "target picker failed: " .. tostring(pre), cycle
            end
            if not pre then
                return false, "nothing to steal"
                    .. (whyPre and (" (" .. tostring(whyPre) .. ")") or ""), cycle
            end
            preTarget = pre
        end

        local firstArea = bait.firstAreaId(0)
        local inBaitArea = nil
        if opts.uid then
            local want = eggs.get(opts.uid)
            inBaitArea = want and firstArea and want.areaId == firstArea or false
        elseif preTarget then
            inBaitArea = firstArea ~= nil and preTarget.areaId == firstArea
        end

        local primed = false
        if inBaitArea then
            log.info("target is in the bait area (%s) - not priming, going straight for it (V3.1 rule)",
                tostring(firstArea))
            cycle.baitSkipped = true
        else
            primed = stage("bait", function()
                return bait.prime({ cancel = cancel })
            end)
        end
        cycle.primed = primed and true or false
        if cancel() then return false, "cancelled", cycle end

        local target
        if opts.uid then
            local want = eggs.get(opts.uid)
            if not want then
                return false, "selected egg is gone", cycle
            end
            local takeable = (want.state == "Slot" or want.state == "Dropped")
            if not takeable or not want.pos then
                
                return false, "waiting for the selected egg (" .. tostring(want.state) .. ")", cycle
            end
            target = want
        elseif opts.pick then

            local ok2, want, why2 = true, preTarget, nil
            if not (cycle.baitSkipped and preTarget) then
                ok2, want, why2 = pcall(opts.pick)
            end
            if not ok2 then
                return false, "target picker failed: " .. tostring(want), cycle
            end
            target = want

            if not target then
                return false, "nothing matches the filter"
                    .. (why2 and (" (" .. tostring(why2) .. ")") or ""), cycle
            end
        else
            target = eggs.best()
        end
        if not target then return false, "nothing to steal", cycle end
        cycle.target = target

        local here = ch.root()
        cycle.distance = here and (target.pos - here.Position).Magnitude or -1

        cycle.state = M.STATE.BAIT_DONE
        phase(token, cycle.state, cycle.primed and "primed"
            or (cycle.baitSkipped and "bait skipped: target in the bait area" or "no bait egg"))
        
        log.info("target uid=%s name=%s area=%s rarity=%s state=%s dist=%.0f primed=%s",
            tostring(target.uid), tostring(target.name), tostring(target.areaId),
            tostring(target.rarity), tostring(target.state), cycle.distance or -1,
            tostring(cycle.primed))

        local took, inInfo
        local retries = 0
        for attempt = 0, TARGET_RETRIES do
            cycle.state = (attempt == 0) and M.STATE.AT_TARGET or M.STATE.TARGET_GRAB_RETRY
            phase(token, cycle.state, target.name)
            took, inInfo = stage(attempt == 0 and "instant" or ("regrab" .. attempt), function()
                return instant.take(target.uid, target.pos, {
                    cancel = cancel,
                    areaId = target.areaId, nestId = target.nestId,
                })
            end)
            if took or cancel() then break end

            local st = inInfo and inInfo.eggState
            local retryable = inInfo and (inInfo.pulledBack
                or st == "Slot" or st == "Dropped")
            if not retryable or attempt == TARGET_RETRIES then break end

            local fresh = eggs.get(target.uid)
            if not fresh or not fresh.pos then break end
            target.pos = fresh.pos
            retries = retries + 1
            log.info("target retry %d/%d (reason=%s state=%s pulledBack=%s)",
                attempt + 1, TARGET_RETRIES,
                tostring(inInfo and inInfo.reason), tostring(st),
                tostring(inInfo and inInfo.pulledBack))
        end
        cycle.grabRetries = retries

        if cancel() then return false, "cancelled", cycle end

        if took then
            cycle.state = M.STATE.CARRYING
            phase(token, cycle.state, "instant")
            cycle.transition = "tp"
            cycle.calls = inInfo and inInfo.calls
            cycle.tpGap = inInfo and inInfo.gap
        else

            cycle.transition = "arc_fallback"
            cycle.instantFail = inInfo and inInfo.reason
            cycle.instantDiag = inInfo

            local reached, moveInfo = stage("approach", function()
                return move.travel{
                    to = target.pos, speed = move.outboundSpeed(),
                    arrive = 4, carrying = false, cancel = cancel, tag = "approach",
                }
            end)
            if cancel() then return false, "cancelled", cycle end
            if not reached then
                return false, "approach: " .. tostring(moveInfo and moveInfo.reason), cycle
            end

            local grabbed, grabInfo = stage("grab", function()
                return grab.take(target.uid, { pos = target.pos, cancel = cancel })
            end)
            if cancel() then return false, "cancelled", cycle end
            if not grabbed then

                eggs.markUnreachable(target.uid)
                return false, "grab: " .. tostring(grabInfo and grabInfo.reason), cycle
            end
            cycle.state = M.STATE.CARRYING
            phase(token, cycle.state, "prompt")
        end

        cycle.state = M.STATE.RETURNING
        phase(token, cycle.state, target.name)
        local delivered, carryInfo = stage("carry", function()
            return carry.home(target.uid, { cancel = cancel })
        end)

        local recoveries = 0
        while not delivered and not cancel()
              and carryInfo and carryInfo.reason
              and tostring(carryInfo.reason):find("dropped in transit", 1, true)
              and recoveries < regrab.K.MAX_PER_STEAL do

            svc.RunService.Heartbeat:Wait()

            recoveries = recoveries + 1
            cycle.recoveries = recoveries
            cycle.state = M.STATE.TARGET_GRAB_RETRY

            local back, rinfo = stage("recover" .. recoveries, function()
                return regrab.recover(target.uid, {
                    cancel = cancel,
                    areaId = target.areaId, nestId = target.nestId,
                })
            end)
            cycle.dropRecovery = rinfo and rinfo.recovery or "?"

            if not back then
                return false, "drop recovery: " .. tostring(rinfo and rinfo.reason), cycle
            end

            cycle.state = M.STATE.RETURNING
            delivered, carryInfo = stage("carry" .. recoveries, function()
                return carry.home(target.uid, { cancel = cancel })
            end)
        end

        if cancel() then return false, "cancelled", cycle end
        if not delivered then
            return false, "carry: " .. tostring(carryInfo and carryInfo.reason), cycle
        end

        cycle.state = M.STATE.DELIVERED
        cycle.terminal = true
        phase(token, cycle.state, target.name)
        fireDelivered(target)
        return true, "delivered", cycle
    end

    local function reportCycle(ok, why, cycle, before, after)
        local parts = {}
        for _, s in ipairs(cycle.stages) do
            parts[#parts + 1] = ("%s=%.0fms%s"):format(s.name, s.ms, s.ok and "" or "!")
        end

        if not ok then
            local marks = BX.profile.marksSince(cycle.t0)
            if #marks > 0 then
                log.warn("timeline: %s", table.concat(marks, " | "))
            end
        end

        local level = ok and log.info or log.warn
        level("cycle %s in %.2fs [%s] target=%s dist=%.0f %s | %s",
            ok and "DELIVERED" or ("FAILED " .. tostring(why)),
            os.clock() - cycle.t0, table.concat(parts, " "),
            cycle.target and cycle.target.name or "-",
            cycle.distance or -1,
            ("state=%s transition=%s calls=%s retries=%d recoveries=%d%s primed=%s%s"):format(
                cycle.state or "?", cycle.transition or "?",
                tostring(cycle.calls or "-"), cycle.grabRetries or 0,
                cycle.recoveries or 0,
                cycle.dropRecovery and (" drop_recovery=" .. cycle.dropRecovery) or "",
                tostring(cycle.primed),
                cycle.instantFail and (" instantFail=" .. tostring(cycle.instantFail)
                    .. " pulledBack=" .. tostring(cycle.instantDiag and cycle.instantDiag.pulledBack)
                    .. " eggState=" .. tostring(cycle.instantDiag and cycle.instantDiag.eggState)) or ""),
            diff(before, after))
    end

    local MAX_PREPS = 3
    local lastIdleWhy = nil

    local function runLoop(token)
        log.info("run %d: begin (tier=%s)", token, dev.tier)
        phase(token, "START", "tier=" .. tostring(dev.tier))
        local preps = 0

        while running and token == runToken and BX.alive() do

            svc.RunService.Heartbeat:Wait()
            if not running or token ~= runToken then break end

            local isCancelled = function()
                return (not running) or token ~= runToken or (not BX.alive())
            end

            local before = snapshot()
            local ok, why, cycle = runCycle(token, isCancelled)
            local after = snapshot()

            local idle = type(why) == "string"
                and (why:find("^nothing to steal") or why:find("^nothing matches the filter")) or false
            if idle then
                if why ~= lastIdleWhy then
                    lastIdleWhy = why
                    log.info("idle: %s", why)
                end
            else
                lastIdleWhy = nil
                if cycle then reportCycle(ok, why, cycle, before, after) end
            end

            if why == "cancelled" then break end

            if ok and not (cycle and cycle.terminal) then

                failures = 0
                preps = preps + 1
                if preps > MAX_PREPS then
                    log.warn("%d preparation passes without a steal - stopping",
                        preps)
                    return "ended"
                end
                log.info("preparation complete (%s) - continuing the same run",
                    tostring(why))
            elseif ok and opts.continuous then

                failures = 0
                cycles = cycles + 1
                log.info("delivered (%d this run) - continuing", cycles)
            elseif ok then
                failures = 0
                cycles = cycles + 1

                log.info("delivered - run complete")
                return "delivered"
            elseif (type(why) == "string" and why:find("^nothing to steal"))
                or why == "nothing matches the filter"
                or (type(why) == "string" and why:find("^nothing matches the filter"))
                or why == "selected egg is gone"
                or (type(why) == "string" and why:find("waiting for the selected egg", 1, true)) then

                task.wait(dev.scale(IDLE_WAIT))
            else
                failures = failures + 1
                local wait = math.min(BACKOFF_BASE * (2 ^ (failures - 1)), BACKOFF_CAP)
                wait = dev.scale(wait)
                log.warn("backing off %.1fs (failure %d)", wait, failures)
                task.wait(wait)
            end
        end

        log.info("run %d: ended", token)
        return "ended"
    end

    local function stop(reason)
        if not running then return end
        running = false

        runToken = runToken + 1
        st.autoStealOn = false

        if sc then

            sc:destroy()
            sc = nil
        end
        failures = 0

        local whose = owner
        owner = nil
        opts = {}

        BX.try("autosteal.antideath", adeath.disarm)
        BX.try("autosteal.humanoid", hswap.disarm)
        BX.try("autosteal.guard", guard.disarm)
        BX.try("autosteal.resetMovement", move.reset)
        BX.try("autosteal.unanchor", function()
            local hrp = ch.root()
            if hrp and hrp.Anchored then hrp.Anchored = false end
        end)

        local restored, skipped, failed = 0, 0, 0
        BX.try("autosteal.restore", function()
            restored, skipped, failed = rs.restoreAll()
        end)

        local leftovers = {}
        BX.try("autosteal.audit", function() leftovers = rs.audit() end)

        if #leftovers == 0 and failed == 0 then
            log.info("autosteal cleanup: PASS (%d restored, %d skipped)",
                restored, skipped)
        else
            log.warn("autosteal cleanup: %d restored, %d skipped, %d FAILED%s",
                restored, skipped, failed,
                #leftovers > 0
                    and (" | still modified: " .. table.concat(leftovers, "; ")) or "")
        end

        log.info("stopped (%s) after %d cycles", reason or "requested", cycles)
        phase(phaseRun, "STOP", reason or "requested")
        log.info("run %d trail: %s", phaseRun, table.concat(phases, " -> "))

        local why = reason or "requested"
        for _, fn in ipairs(stopListeners) do
            task.spawn(function() BX.try("autosteal.onStop", fn, why, whose) end)
        end
    end

    function M.capability()
        local exec = BX.require("core.exec")
        local paths = {}
        if instant.ready then paths[#paths + 1] = "instant (CarryFieldEgg)" end
        if exec.can.prompts then paths[#paths + 1] = "prompt (" .. tostring(exec.promptVia) .. ")" end
        if #paths == 0 then
            return false, "Auto Steal cannot run on this executor: no game-module require ("
                .. tostring(exec.gameRequireWhy) .. ") and no proximity prompt path"
        end
        return true, table.concat(paths, " + ")
    end

    local function start(src)
        if running then return end
        local okCap, capWhy = M.capability()
        if not okCap then
            log.error("%s", capWhy)
            return false, capWhy
        end
        owner = tostring(src or "main")
        opts = optsFor[owner] or {}
        log.info("run starting for %s - pickup via %s", owner, capWhy)

        if sc then sc:destroy() end

        runToken = runToken + 1
        running  = true
        st.autoStealOn = true
        sc = BX.scope("features.autosteal")

        local token = runToken

        ch.onSpawn(sc, "autosteal.respawn", function()
            if not running or token ~= runToken then return end
            failures = 0
            log.trace("respawn: run %d continues", token)
        end)

        local armed = {}
        for _, a in ipairs({ { "humanoid", hswap.arm }, { "guard", guard.arm },
                             { "antideath", adeath.arm } }) do
            local ok = BX.try("autosteal.arm." .. a[1], a[2])
            armed[#armed + 1] = a[1] .. (ok and "=ok" or "=FAILED")
        end
        log.info("run %d: armed %s", token, table.concat(armed, " "))

        sc:spawn("loop", function()
            log.info("run %d: worker thread started (owner=%s, options: %s)",
                token, tostring(owner),
                opts.uid and ("uid=" .. tostring(opts.uid))
                    or (opts.pick and ("picker" .. (opts.continuous and ", continuous" or ""))
                        or "best value"))
            local reason = runLoop(token)

            if token == runToken then
                if reason == "delivered" then
                    stop("delivered")
                elseif running then
                    stop(reason or "ended")
                end
            end
        end)
    end

    function M.setOptions(src, o)
        if type(src) == "table" or src == nil then src, o = "main", src end
        src = tostring(src)
        optsFor[src] = o or {}
        
        if running and owner == src then
            opts = optsFor[src]
            log.info("%s updated its options mid-run", src)
        end
    end

    function M.setEnabled(on, src)
        src = tostring(src or "main")
        if on then
            local okStart, why = start(src)
            if okStart == false then return false, why end
        else

            if running and owner ~= nil and owner ~= src then
                log.info("%s asked to stop, but %s owns this run - ignored", src, owner)
                return false
            end
            stop("toggled off")
        end
        return true
    end

    function M.owner() return owner end

    function M.isRunning()
        return running
    end

    function M.runOnce(cancelFn)

        local before = snapshot()
        local ok, why, cycle = runCycle(runToken, cancelFn or function() return false end)
        local after = snapshot()
        if cycle then reportCycle(ok, why, cycle, before, after) end
        return ok, why, cycle, before, after
    end

    function M.status()
        return {
            running  = running,
            token    = runToken,
            cycles   = cycles,
            failures = failures,
            tier     = dev.tier,
            scope    = sc and sc:counts() or nil,
        }
    end

    M.stop = stop

    return M
end)

BX.module("features.bossfight", function(BX)
    local svc  = BX.require("core.services")
    local dev  = BX.require("core.device")
    local ch   = BX.require("core.character")
    local net  = BX.require("core.net")
    local boss = BX.require("features.boss")
    local mov  = BX.require("features.movement")
    local auto = BX.require("features.autosteal")
    local log  = BX.require("boot.log").for_module("bossfight")

    local M = {}

    local K = {

        TICK            = 0.12,

        SWING_GAP       = 0.65,
        REACH           = 9,

        EQUIP_SETTLE    = 0.25,

        RESPAWN_SETTLE  = 0.6,
        
        HAND_REACH_Y    = 30,
        HAND_CHASE_Y    = 90,
        HAND_RISE_EPS   = 2,      
        HAND_COMMIT     = 1.5,    

        SURFACE_MARGIN  = -20,
        
        STEP_SPEED      = 420,
        MAX_STEP        = 14,
        MAX_DT          = 0.05,
        SINK_MAX        = 6,      
        Y_TAU           = 0.12,   
        STUCK_TIME      = 2.5,
        RIM_SWEEP       = { 25, 50, 75, 100, 125, 150 },
        RIM_LOOKAHEAD   = 6,
        MOVE_ARRIVE     = 1.5,
        SWING_SLACK     = 4,      
        AIM_COS         = 0.906,  
        AIM_EASE        = 0.35,
        TRACK_TAU       = 0.18,   
        TRACK_JUMP      = 60,
        WAIT_MAX        = 2.5,    
        
        FLING_UP        = 60,
        FLING_MULT      = 2.0,
        
        GROUND_BAND     = 25,
        PROBE_UP        = 40,
        PROBE_DOWN      = 220,
        SOLID_STEPS     = 8,
        IGNORE_TTL      = 0.5,    
        
        RING_STEP_DEG   = 22,
        RING_RADII      = { 1.0, 0.85, 1.15, 0.7, 1.3 },
        AROUND_ANGLES   = { 25, 45, 70, 95, 120, 145 },
        AROUND_FRAC     = 0.55,
        AROUND_MIN_R    = 90,
        
        HAZARD_CACHE    = 0.1,
        HAZARD_CLEAR    = 6,
        SLAM_CLEAR      = 12,
        RING_CLEAR      = 2,      
        HOLE_CLEAR      = 6,
        DODGE_GAP       = 0.08,
        DODGE_POINTS    = 16,
        DODGE           = false,  
        ORBIT_TRIGGER   = 34,
        ORBIT_STEP      = 0.55,
        
        VOID_GAP        = 0.2,
        VOID_MISSES     = 3,
        VOID_DROP_PROOF = 25,
        MAX_RISE        = 8,
        HAND_BONES      = { "UpperHand1.R", "UpperHand1.L", "LowerHand1.R", "LowerHand1.L" },
    }
    M.K = K

    local sc, enabled = nil, false
    local stats = { swings = 0, dodges = 0, flings = 0, voidSaves = 0, rescues = 0, kills = 0 }
    function M.stats() return table.clone(stats) end
    function M.isOn() return enabled end

    local S = nil
    local function fresh()
        return {
            goal = nil, dodge = nil, aim = nil, trackPos = nil,
            handY = {}, handPick = nil, handPickAt = 0,
            lastSolid = nil, arenaFloorY = nil,
            stuckBest = nil, stuckSince = nil, stuckFlip = false, rimSide = 1,
            lastSwingAt = 0, batFor = nil, waitAt = nil, idlePhase = false,
            arena = nil, hazards = nil, hazardsAt = 0,
            ignore = nil, ignoreAt = 0,
            inArena = false, noclipped = false, left = false,
            settleUntil = 0, batAskedAt = 0,
            voidAnchor = nil, voidMisses = 0,
            lastLog = {},
            phase = nil, kind = nil,
        }
    end

    local function every(key, secs, fmt, ...)
        local now = os.clock()
        if now - (S.lastLog[key] or 0) < secs then return end
        S.lastLog[key] = now
        log.info(fmt, ...)
    end

    local function inArena()
        return svc.LocalPlayer:GetAttribute("InBossArena") == true
    end
    M.inArena = inArena

    local function arena()
        local a = S.arena
        if a and a.Parent then return a end
        a = workspace:FindFirstChild("BossArena") or workspace:FindFirstChild("BossArena", true)
        S.arena = a
        return a
    end

    local function arenaFloor()
        local a = arena()
        local f = a and a:FindFirstChild("Floor", true)
        if f and f:IsA("BasePart") then return f end
        return nil
    end

    local function arenaCentre()
        local f = arenaFloor()
        if f then return f.Position end
        local a = arena()
        if a and a.PrimaryPart then return a.PrimaryPart.Position end
        return nil
    end

    local function bossModel()
        local a = arena()
        if not a then return nil end
        local b = a:FindFirstChild("Boss", true)
        if b and b:IsA("Model") then return b end
        return nil
    end

    local function phase()
        local b = bossModel()
        if not b then return nil end
        if b:GetAttribute("Spawning") then return nil end
        if b:GetAttribute("PhaseTwoAt") ~= nil then return "hands" end
        return "crystals"
    end

    local probeParams = RaycastParams.new()
    probeParams.FilterType = Enum.RaycastFilterType.Exclude
    probeParams.IgnoreWater = true

    local function refreshIgnore()
        local now = os.clock()
        if S.ignore and (now - S.ignoreAt) < K.IGNORE_TTL then return end
        local ignore = {}
        for _, pl in ipairs(svc.Players:GetPlayers()) do
            if pl.Character then ignore[#ignore + 1] = pl.Character end
        end
        local a = arena()
        if a then
            for _, nm in ipairs({ "CrystalTowers", "Boss", "SlamIndicator",
                                  "SlamArmHitbox", "SlamRestHitbox" }) do
                local d = a:FindFirstChild(nm, true)
                if d then ignore[#ignore + 1] = d end
            end
        end
        for _, nm in ipairs({ "BossHazards", "BossBlackHole" }) do
            local d = workspace:FindFirstChild(nm)
            if d then ignore[#ignore + 1] = d end
        end
        probeParams.FilterDescendantsInstances = ignore
        S.ignore, S.ignoreAt = ignore, now
    end

    local function groundAt(pos)
        refreshIgnore()

        local top = pos.Y + K.PROBE_UP
        local f = arenaFloor()
        if f then top = math.max(top, f.Position.Y + K.PROBE_UP) end
        local reach = math.max(K.PROBE_DOWN, (top - pos.Y) + K.PROBE_DOWN)
        local r = workspace:Raycast(Vector3.new(pos.X, top, pos.Z),
                                    Vector3.new(0, -reach, 0), probeParams)
        if not r then return nil end
        if f and (r.Position.Y - f.Position.Y) > K.GROUND_BAND then return nil end
        return r.Position.Y
    end

    local function onFloor(pos) return groundAt(pos) ~= nil end

    local function lastSolidToward(from, to)
        local flat = Vector3.new(to.X - from.X, 0, to.Z - from.Z)
        local dist = flat.Magnitude
        if dist < 1 then return nil end
        local dir = flat.Unit
        local best

        local step = math.max(dist / K.SOLID_STEPS, 20)
        for i = 1, K.SOLID_STEPS do
            local d = step * i
            if d > dist then break end
            local p = from + dir * d
            local gy = groundAt(Vector3.new(p.X, from.Y, p.Z))
            if not gy then break end
            best = Vector3.new(p.X, gy, p.Z)
        end
        return best
    end

    local function clearLine(a, b)
        local flat = Vector3.new(b.X - a.X, 0, b.Z - a.Z)
        local dist = flat.Magnitude
        if dist < 1 then return true end
        local dir = flat.Unit
        local step = math.max(dist / K.SOLID_STEPS, 20)
        for i = 1, K.SOLID_STEPS do
            local d = step * i
            if d >= dist then break end
            local p = a + dir * d
            if not groundAt(Vector3.new(p.X, a.Y, p.Z)) then return false end
        end
        return true
    end

    local function ringWaypoint(from, to)
        local mid = arenaCentre()
        if not mid then return nil end
        local a = Vector3.new(from.X - mid.X, 0, from.Z - mid.Z)
        local b = Vector3.new(to.X - mid.X, 0, to.Z - mid.Z)
        if a.Magnitude < 20 or b.Magnitude < 20 then return nil end
        local ang1, ang2 = math.atan2(a.Z, a.X), math.atan2(b.Z, b.X)
        local diff = ang2 - ang1
        while diff > math.pi do diff = diff - 2 * math.pi end
        while diff < -math.pi do diff = diff + 2 * math.pi end
        local step = math.min(math.abs(diff), math.rad(K.RING_STEP_DEG))
        if diff < 0 then step = -step end
        local want = ang1 + step
        for _, mul in ipairs(K.RING_RADII) do
            local r = a.Magnitude * mul
            local p = Vector3.new(mid.X + math.cos(want) * r, from.Y, mid.Z + math.sin(want) * r)
            local gy = groundAt(p)
            if gy then
                local wp = Vector3.new(p.X, gy, p.Z)
                if clearLine(from, wp) then return wp, math.deg(step) end
            end
        end
        return nil
    end

    local function rotated(dir, a)
        return Vector3.new(dir.X * math.cos(a) - dir.Z * math.sin(a), 0,
                           dir.X * math.sin(a) + dir.Z * math.cos(a))
    end

    local function detourAround(from, to)
        if clearLine(from, to) then return nil end
        local flat = Vector3.new(to.X - from.X, 0, to.Z - from.Z)
        local dist = flat.Magnitude
        if dist < 1 then return nil end
        local dir = flat.Unit
        local r = math.max(dist * K.AROUND_FRAC, K.AROUND_MIN_R)
        for _, deg in ipairs(K.AROUND_ANGLES) do
            for _, sign in ipairs({ 1, -1 }) do
                local wp = from + rotated(dir, math.rad(deg) * sign) * r
                local gy = groundAt(Vector3.new(wp.X, from.Y, wp.Z))
                if gy then
                    wp = Vector3.new(wp.X, gy, wp.Z)
                    if clearLine(from, wp) and clearLine(wp, to) then return wp, deg * sign end
                end
            end
        end
        for _, deg in ipairs(K.AROUND_ANGLES) do
            for _, sign in ipairs({ 1, -1 }) do
                local wp = from + rotated(dir, math.rad(deg) * sign) * r
                local gy = groundAt(Vector3.new(wp.X, from.Y, wp.Z))
                if gy and clearLine(from, Vector3.new(wp.X, gy, wp.Z)) then
                    return Vector3.new(wp.X, gy, wp.Z), deg * sign
                end
            end
        end
        return nil
    end

    local function hazardParts()
        local now = os.clock()
        if S.hazards and (now - S.hazardsAt) < K.HAZARD_CACHE then return S.hazards end
        local out = {}
        local folder = workspace:FindFirstChild("BossHazards")
        if folder then
            for _, d in ipairs(folder:GetDescendants()) do
                if d:IsA("BasePart") then out[#out + 1] = d end
            end
        end
        local a = arena()
        if a then
            for _, name in ipairs({ "SlamIndicator", "SlamArmHitbox", "SlamRestHitbox" }) do
                local d = a:FindFirstChild(name)
                if d and d:IsA("BasePart") then out[#out + 1] = d end
            end
        end
        local bh = workspace:FindFirstChild("BossBlackHole")
        if bh and bh:IsA("BasePart") then out[#out + 1] = bh end
        S.hazards, S.hazardsAt = out, now
        return out
    end

    local function hazardClear(part)
        local n = part.Name
        if n == "BossBlackHole" then return K.HOLE_CLEAR end
        if n:find("Slam") then return K.SLAM_CLEAR end
        if n:find("Ring") then return K.RING_CLEAR end
        return K.HAZARD_CLEAR
    end

    local function inHazard(part, pos, extra)
        local clear = hazardClear(part) + (extra or 0)
        if part:IsA("Part") and part.Shape == Enum.PartType.Cylinder then
            local flat = Vector3.new(pos.X - part.Position.X, 0, pos.Z - part.Position.Z)
            return flat.Magnitude <= part.Size.Y * 0.5 + clear
        end
        local rel = part.CFrame:PointToObjectSpace(pos)
        local half = part.Size * 0.5
        return math.abs(rel.X) <= half.X + clear
            and math.abs(rel.Z) <= half.Z + clear
            and math.abs(rel.Y) <= half.Y + 8
    end

    local function inAnyHazard(pos, extra)
        if not K.DODGE then return nil end
        for _, part in ipairs(hazardParts()) do
            if inHazard(part, pos, extra) then return part end
        end
        return nil
    end

    local function dodgeScore(spot, here)
        local aim = S.aim
        if typeof(aim) == "Vector3" then
            return Vector3.new(spot.X - aim.X, 0, spot.Z - aim.Z).Magnitude
        end
        return Vector3.new(spot.X - here.X, 0, spot.Z - here.Z).Magnitude
    end

    local function dodgeHazards()
        if not K.DODGE then S.dodge = nil return false end
        local h = ch.root()
        if not h then return false end
        local parts = hazardParts()
        if #parts == 0 then S.dodge = nil return false end
        local hit = nil
        for _, part in ipairs(parts) do
            if inHazard(part, h.Position) then hit = part break end
        end
        if not hit then S.dodge = nil return false end

        local here = h.Position
        local cands = {}
        if hit:IsA("Part") and hit.Shape == Enum.PartType.Cylinder then
            local want = hit.Size.Y * 0.5 + K.HOLE_CLEAR + 4
            for i = 0, K.DODGE_POINTS - 1 do
                local ang = (2 * math.pi / K.DODGE_POINTS) * i
                cands[#cands + 1] = Vector3.new(hit.Position.X + math.cos(ang) * want, here.Y,
                                                hit.Position.Z + math.sin(ang) * want)
            end
        else
            local rel = hit.CFrame:PointToObjectSpace(here)
            local half = hit.Size * 0.5
            local clear = hazardClear(hit) + 4
            local outX = (rel.X >= 0 and 1 or -1) * (half.X + clear)
            local outZ = (rel.Z >= 0 and 1 or -1) * (half.Z + clear)
            local cf = hit.CFrame
            cands[#cands + 1] = cf:PointToWorldSpace(Vector3.new(rel.X, rel.Y, outZ))
            cands[#cands + 1] = cf:PointToWorldSpace(Vector3.new(outX, rel.Y, rel.Z))
            cands[#cands + 1] = cf:PointToWorldSpace(Vector3.new(rel.X, rel.Y, -outZ))
            cands[#cands + 1] = cf:PointToWorldSpace(Vector3.new(-outX, rel.Y, rel.Z))
            cands[#cands + 1] = cf:PointToWorldSpace(Vector3.new(outX, rel.Y, outZ))
            cands[#cands + 1] = cf:PointToWorldSpace(Vector3.new(-outX, rel.Y, outZ))
        end

        local best, bestScore
        for _, spot in ipairs(cands) do
            if onFloor(spot) and not inAnyHazard(spot, 0) then
                local scr = dodgeScore(spot, here)
                if not bestScore or scr < bestScore then best, bestScore = spot, scr end
            end
        end
        if not best then
            for _, spot in ipairs(cands) do
                if onFloor(spot) then
                    local scr = dodgeScore(spot, here)
                    if not bestScore or scr < bestScore then best, bestScore = spot, scr end
                end
            end
        end
        if not best then
            local mid = arenaCentre()
            if mid then
                local inward = Vector3.new(mid.X - here.X, 0, mid.Z - here.Z)
                if inward.Magnitude > 1 then
                    best = here + inward.Unit * math.min(inward.Magnitude, 60)
                end
            end
        end
        if not best then return true end
        S.dodge = { pos = best }
        stats.dodges = stats.dodges + 1
        return true
    end

    local function orbitPoint(tpos, reach)
        local h = ch.root()
        local bh = workspace:FindFirstChild("BossBlackHole")
        if not h or not bh or not bh:IsA("BasePart") then return nil end
        local toHole = Vector3.new(bh.Position.X - h.Position.X, 0, bh.Position.Z - h.Position.Z)
        if toHole.Magnitude > K.ORBIT_TRIGGER then return nil end
        local rel = Vector3.new(h.Position.X - tpos.X, 0, h.Position.Z - tpos.Z)
        if rel.Magnitude < 1 then rel = Vector3.new(1, 0, 0) end
        local ang = math.atan2(rel.Z, rel.X)
        local r = math.max(reach, 6)
        local function at(a)
            return Vector3.new(tpos.X + math.cos(a) * r, h.Position.Y, tpos.Z + math.sin(a) * r)
        end
        local p1, p2 = at(ang + K.ORBIT_STEP), at(ang - K.ORBIT_STEP)
        local function fromHole(p)
            return Vector3.new(p.X - bh.Position.X, 0, p.Z - bh.Position.Z).Magnitude
        end
        local first, second = p1, p2
        if fromHole(p2) > fromHole(p1) then first, second = p2, p1 end
        if onFloor(first) then return first end
        if onFloor(second) then return second end
        return nil
    end

    local function isBatTool(t)
        return t:IsA("Tool") and (t:GetAttribute("IsBat") == true or t.Name:find("Bat") ~= nil)
    end

    local function equipBat()
        local char = ch.get()
        if not char then return nil end
        for _, t in ipairs(char:GetChildren()) do
            if isBatTool(t) then return t end
        end
        local bp = svc.LocalPlayer:FindFirstChild("Backpack")
        if bp then
            for _, t in ipairs(bp:GetChildren()) do
                if isBatTool(t) then

                    local hum = ch.humanoid()
                    local ok = hum and pcall(function() hum:EquipTool(t) end)
                    if not ok or t.Parent ~= char then t.Parent = char end
                    log.info("equipped %s", t.Name)
                    return t
                end
            end
        end
        return nil
    end

    local batSeq, batAnimTrack, batAnimFor = 0, nil, nil
    local function batSwing(bat)
        local ok = pcall(function()
            local rem = net.find("RE/BatSwing/Trigger")
            assert(rem, "no BatSwing remote")
            batSeq = batSeq + 1
            rem:FireServer(nil, ("%d:%d:%d"):format(svc.LocalPlayer.UserId, batSeq,
                math.floor(workspace:GetServerTimeNow() * 1000)))
        end)
        if not ok then
            pcall(function() bat:Activate() end)
            return
        end
        pcall(function()
            local anim = bat:FindFirstChild("HitAnim")
            local hum = ch.humanoid()
            local animator = hum and hum:FindFirstChildOfClass("Animator")
            if anim and animator then
                if batAnimFor ~= animator then
                    batAnimTrack = animator:LoadAnimation(anim)
                    batAnimFor = animator
                end
                batAnimTrack:Play()
            end
            local snd = bat:FindFirstChild("Slash", true)
            if snd and snd:IsA("Sound") then snd:Play() end
        end)
    end

    local function readyAfterRagdoll()
        local hm, h = ch.humanoid(), ch.root()
        if not hm or not h then return end
        hm.PlatformStand = false
        hm.Sit = false
        hm.AutoRotate = true
        local st = hm:GetState()
        if st == Enum.HumanoidStateType.Physics
           or st == Enum.HumanoidStateType.PlatformStanding
           or st == Enum.HumanoidStateType.FallingDown
           or st == Enum.HumanoidStateType.Ragdoll
           or st == Enum.HumanoidStateType.Seated then
            hm:ChangeState(Enum.HumanoidStateType.GettingUp)
        end
        h.AssemblyLinearVelocity = Vector3.zero
        h.AssemblyAngularVelocity = Vector3.zero
    end

    local function antiFling()
        local h, hum = ch.root(), ch.humanoid()
        if not h or not hum then return end
        local v = h.AssemblyLinearVelocity
        local flat = (v * Vector3.new(1, 0, 1)).Magnitude
        local cap = math.max((hum.WalkSpeed or 16) * K.FLING_MULT, 120)
        if v.Y <= K.FLING_UP and flat <= cap then return end
        local keep = Vector3.zero
        if flat > 0.001 then
            keep = (v * Vector3.new(1, 0, 1)).Unit * math.min(flat, hum.WalkSpeed or 16)
        end
        h.AssemblyLinearVelocity = Vector3.new(keep.X, math.min(v.Y, 0), keep.Z)
        h.AssemblyAngularVelocity = Vector3.zero
        stats.flings = stats.flings + 1
        every("fling", 2, "cancelled a launch (up %.0f, flat %.0f) - %d so far",
            v.Y, flat, stats.flings)
    end

    local function targetReach(part)
        if typeof(part) == "Vector3" then return K.REACH end
        if not (part and part:IsA("BasePart")) then return K.REACH end
        local half = math.max(part.Size.X, part.Size.Z) * 0.5
        return math.max(K.REACH, half + K.SURFACE_MARGIN)
    end

    local function target()
        local h = ch.root()
        if not h then return nil end
        local ph = phase()
        if not ph then return nil end

        if ph == "crystals" then
            local a = arena()
            local towers = a and a:FindFirstChild("CrystalTowers", true)
            if not towers then return nil end
            local best, bestD
            for _, d in ipairs(towers:GetDescendants()) do
                if d:IsA("BasePart") and d.Name == "Hitbox" then

                    local hp = d:GetAttribute("Health")
                    if type(hp) == "number" and hp > 0 then
                        local dist = (d.Position - h.Position).Magnitude
                        if not bestD or dist < bestD then best, bestD = d, dist end
                    end
                end
            end
            if best then return best, "crystal" end
            return nil
        end

        local b = bossModel()
        if not b then return nil end
        local myY = h.Position.Y
        local low, lowD, any, anyD, anyUp
        for _, bn in ipairs(K.HAND_BONES) do
            local bone = b:FindFirstChild(bn, true)
            if bone and bone:IsA("Bone") then
                local pos
                pcall(function() pos = bone.TransformedWorldCFrame.Position end)
                pos = pos or bone.WorldPosition
                if pos then

                    local prev = S.handY[bn]
                    S.handY[bn] = pos.Y
                    local rising = prev ~= nil and (pos.Y - prev) > K.HAND_RISE_EPS
                    if not rising then
                        local flat = Vector3.new(pos.X - h.Position.X, 0, pos.Z - h.Position.Z).Magnitude
                        if not anyD or flat < anyD then any, anyD, anyUp = pos, flat, pos.Y - myY end
                        if (pos.Y - myY) <= K.HAND_REACH_Y and (not lowD or flat < lowD) then
                            low, lowD = pos, flat
                        end
                    end
                end
            end
        end

        local function landable(p)
            if not p then return nil end
            if onFloor(p) and clearLine(h.Position, p) then return p end
            local wp, ang = ringWaypoint(h.Position, p)
            if not wp then wp, ang = detourAround(h.Position, p) end
            if wp then
                every("pit", 2, "pit in the way - walking round the ring (%+.0f deg)", ang or 0)
                return wp
            end
            return lastSolidToward(h.Position, p)
        end

        low = landable(low)
        if any and (anyUp or 0) <= K.HAND_CHASE_Y then any = landable(any) else any = nil end

        local now = os.clock()
        if S.handPick and (now - S.handPickAt) < K.HAND_COMMIT then
            local keep = S.handPick
            if (low and (low - keep).Magnitude < 220) or (any and (any - keep).Magnitude < 220) then
                return keep, "hand"
            end
        end
        if low then
            S.handPick, S.handPickAt = low, now
            return low, "hand"
        end
        if any then
            S.handPick, S.handPickAt = any, now
            return any, "hand"
        end
        if anyUp then
            every("high", 2, "hands up: nearest is %.0f studs up (need <= %d) - holding for the slam",
                anyUp, K.HAND_REACH_Y)
        end
        return nil
    end

    local function leaveArena()
        local a = arena()
        local exit = a and a:FindFirstChild("BossArenaLeaveTeleport", true)
        local part = exit and (exit:IsA("BasePart") and exit
            or exit:FindFirstChild("Hitbox", true)
            or exit:FindFirstChildWhichIsA("BasePart", true))
        local c = ch.get()
        if not (part and c) then return false end
        c:MoveTo(part.Position + Vector3.new(0, 3, 0))
        return true
    end

    local function setNoclip(on)
        if on == S.noclipped then return end
        S.noclipped = on
        if on then
            mov.noclip(true)
        elseif not auto.isRunning() then

            mov.noclip(false)
        end
    end

    local function moverStep(dt)
        if not S.inArena or auto.isRunning() then return end

        if S.settleUntil and os.clock() < S.settleUntil then return end
        antiFling()

        local dodging = S.dodge ~= nil
        local goal = S.dodge or S.goal
        if not goal then return end
        local h, hum = ch.root(), ch.humanoid()
        if not h or not hum then return end

        if groundAt(h.Position) then
            S.lastSolid = h.Position
        elseif S.lastSolid then
            local back = Vector3.new(S.lastSolid.X - h.Position.X, 0, S.lastSolid.Z - h.Position.Z)
            if back.Magnitude > 1 then
                local st2 = math.min(back.Magnitude, math.min(dt, K.MAX_DT) * K.STEP_SPEED, K.MAX_STEP)
                local nb = h.Position + back.Unit * st2
                local gyb = groundAt(nb) or S.lastSolid.Y
                hum.PlatformStand = false
                h.CFrame = CFrame.lookAt(Vector3.new(nb.X, gyb, nb.Z), Vector3.new(nb.X, gyb, nb.Z) + back.Unit)
                h.AssemblyLinearVelocity = Vector3.zero
                stats.rescues = stats.rescues + 1
                every("rescue", 1, "no ground underneath - walking back to solid")
            end
            return
        end

        local flat = Vector3.new(goal.pos.X - h.Position.X, 0, goal.pos.Z - h.Position.Z)
        local reach = dodging and 0 or (goal.reach or K.REACH)
        local left = flat.Magnitude - reach
        if left <= K.MOVE_ARRIVE then
            if dodging then S.dodge = nil else S.goal = nil end
            return
        end

        local now = os.clock()
        if not S.stuckBest or left < S.stuckBest - 2 then S.stuckBest, S.stuckSince = left, now end
        local dirUse = flat.Unit
        if S.stuckSince and (now - S.stuckSince) > K.STUCK_TIME then
            S.stuckFlip = not S.stuckFlip
            local sgn = S.stuckFlip and 1 or -1
            dirUse = Vector3.new(-flat.Unit.Z * sgn, 0, flat.Unit.X * sgn)
            S.stuckSince, S.stuckBest = now, nil
            every("stuck", 2, "not making progress - sidestepping")
        end

        local step = math.min(left, math.min(dt, K.MAX_DT) * K.STEP_SPEED, K.MAX_STEP)
        local nxt = h.Position + dirUse * step
        if not dodging and inAnyHazard(nxt, 0) then return end

        local function groundFor(dir, dist)
            local probe = h.Position + dir * dist
            return groundAt(Vector3.new(probe.X, h.Position.Y, probe.Z))
        end
        local gy = groundFor(dirUse, step)

        if gy then
            S.arenaFloorY = gy
        elseif S.arenaFloorY and h.Position.Y < S.arenaFloorY - K.SINK_MAX then
            h.CFrame = CFrame.new(h.Position.X, S.arenaFloorY, h.Position.Z)
            h.AssemblyLinearVelocity = Vector3.zero
            every("sink", 2, "dropped below the floor - lifted back onto it")
            return
        end

        if not gy then

            local found = nil
            for _, deg in ipairs(K.RIM_SWEEP) do
                for _, sgn in ipairs(S.rimSide == -1 and { -1, 1 } or { 1, -1 }) do
                    local d = rotated(dirUse, math.rad(deg * sgn))
                    local g = groundFor(d, step)
                    if g and groundFor(d, step + K.RIM_LOOKAHEAD) then
                        found, gy = d, g
                        S.rimSide = sgn
                        break
                    end
                end
                if found then break end
            end
            if not found then
                if dodging then S.dodge = nil else S.goal = nil end
                return
            end
            dirUse = found
            nxt = h.Position + dirUse * step
            S.stuckSince = now
            every("rim", 2, "hole in the way - following the rim round")
        end

        local curY = h.Position.Y
        local k = 1 - math.exp(-dt / K.Y_TAU)
        local dest = Vector3.new(nxt.X, curY + (gy - curY) * k, nxt.Z)
        hum.PlatformStand = false
        hum:Move(Vector3.zero, false)
        h.CFrame = CFrame.lookAt(dest, dest + flat.Unit)
        h.AssemblyLinearVelocity = Vector3.new(0, h.AssemblyLinearVelocity.Y, 0)
        h.AssemblyAngularVelocity = Vector3.zero
    end

    local function fightTick()

        local inside = inArena()
        if inside ~= S.inArena then
            S.inArena = inside
            setNoclip(inside)
            S.goal, S.dodge, S.aim, S.trackPos, S.handPick = nil, nil, nil, nil, nil
            S.lastSolid, S.arenaFloorY, S.left = nil, nil, false
            S.voidAnchor, S.voidMisses = nil, 0
            if inside then

                S.settleUntil = os.clock() + K.RESPAWN_SETTLE
                readyAfterRagdoll()
            end
            log.info(inside and "in the arena - fighting" or "left the arena")
        end
        if not inside or auto.isRunning() or S.left then return end

        if S.settleUntil and os.clock() < S.settleUntil then return end

        local bat = equipBat()
        if not bat then
            if os.clock() - (S.batAskedAt or 0) > 5 then
                S.batAskedAt = os.clock()
                local okW, msgW = net.call("RF/Codex/AskWearFieldBat")
                log.info("no bat - AskWearFieldBat -> %s %s", tostring(okW), tostring(msgW or ""))
            end
        elseif S.batFor ~= bat then
            S.batFor = bat
            task.wait(K.EQUIP_SETTLE)
        end

        local hmz = ch.humanoid()
        if hmz then
            local stt = hmz:GetState()
            if hmz.PlatformStand or stt == Enum.HumanoidStateType.Physics
               or stt == Enum.HumanoidStateType.PlatformStanding
               or stt == Enum.HumanoidStateType.None then
                readyAfterRagdoll()
            end
        end

        local inHaz = dodgeHazards()

        local snap = boss.snapshot()
        if snap and tonumber(snap.BossHealth) and snap.BossHealth <= 0 then
            stats.kills = stats.kills + 1
            log.info("boss dead - claiming and walking out")
            local n = boss.claimMilestones()
            log.info("claimed %d milestone(s)", n)
            S.left = leaveArena()
            S.goal, S.aim = nil, nil
            return
        end

        S.phase = phase()
        local part, kind = target()
        if not part then
            S.goal, S.aim, S.kind = nil, nil, nil
            if S.idlePhase ~= S.phase then
                S.idlePhase = S.phase
                log.info("nothing to hit (phase=%s) - holding position", tostring(S.phase or "spawning"))
            end
            return
        end
        S.idlePhase, S.kind = false, kind

        local tpos = (typeof(part) == "Vector3") and part or part.Position
        local h = ch.root()
        if not h then return end
        local reach = targetReach(part)

        local flatDir = Vector3.new(tpos.X - h.Position.X, 0, tpos.Z - h.Position.Z)
        local d = flatDir.Magnitude

        local stand = h.Position + (d > 0.001 and flatDir.Unit * math.max(d - reach, 0) or Vector3.zero)
        if inAnyHazard(Vector3.new(stand.X, h.Position.Y, stand.Z), 0) then
            S.waitAt = S.waitAt or os.clock()
            if os.clock() - S.waitAt < K.WAIT_MAX then
                S.goal = nil
                return
            end
        else
            S.waitAt = nil
        end

        S.aim = tpos

        if d > reach + K.SWING_SLACK then
            
            local smooth = tpos
            if kind == "hand" then
                local prev = S.trackPos
                if prev and (prev - tpos).Magnitude < K.TRACK_JUMP then
                    smooth = prev:Lerp(tpos, 1 - math.exp(-K.TICK / K.TRACK_TAU))
                end
                S.trackPos = smooth
            else
                S.trackPos = nil
            end
            S.goal = { pos = smooth, reach = reach }
            return
        end

        local orbit = orbitPoint(tpos, reach)
        if orbit then
            S.goal = { pos = orbit, reach = 0 }
            every("orbit", 3, "black hole is on us - orbiting the target")
        else
            S.goal = nil
        end
        if inHaz then return end

        local flat = Vector3.new(tpos.X - h.Position.X, 0, tpos.Z - h.Position.Z)
        if flat.Magnitude > 0.1 then
            local wantDir = flat.Unit
            local haveDir = h.CFrame.LookVector * Vector3.new(1, 0, 1)
            haveDir = haveDir.Magnitude > 0.001 and haveDir.Unit or wantDir
            if haveDir:Dot(wantDir) < K.AIM_COS then
                local cur = h.CFrame
                h.CFrame = cur:Lerp(CFrame.lookAt(cur.Position, cur.Position + wantDir), K.AIM_EASE)
            end
        end

        if not bat or not bat.Parent then return end
        if bat:GetAttribute("CooldownActive") == true then return end
        if os.clock() - S.lastSwingAt < K.SWING_GAP then return end
        S.lastSwingAt = os.clock()
        batSwing(bat)
        stats.swings = stats.swings + 1
        if stats.swings % 20 == 1 then
            log.info("swinging at the %s (%d swings)", tostring(kind), stats.swings)
        end
    end

    local function voidTick()
        if not S.inArena then return end
        local c, h = ch.get(), ch.root()
        if not (c and h) then return end
        local pos = h.Position
        local gy = groundAt(pos)
        if gy and math.abs(pos.Y - gy) <= K.MAX_RISE then
            S.voidAnchor = Vector3.new(pos.X, gy, pos.Z)
            S.voidMisses = 0
            return
        end

        if not gy then S.voidMisses = S.voidMisses + 1 else S.voidMisses = 0 end
        local falling = S.voidAnchor and (pos.Y < S.voidAnchor.Y - K.VOID_DROP_PROOF)
        if S.voidMisses >= K.VOID_MISSES and falling then
            S.voidMisses = 0
            local back = S.voidAnchor or arenaCentre()
            if back then
                stats.voidSaves = stats.voidSaves + 1
                h.AssemblyLinearVelocity = Vector3.zero
                h.AssemblyAngularVelocity = Vector3.zero
                c:MoveTo(back)
                h.CFrame = CFrame.new(back)
                log.info("voidwatch: off the floor at (%.0f, %.0f, %.0f) - pulled back (#%d)",
                    pos.X, pos.Y, pos.Z, stats.voidSaves)
                task.wait(0.3)
            end
        end
    end

    function M.status()
        if not enabled then return { title = "Auto fight", body = "off" } end
        if auto.isRunning() then
            return { title = "Auto fight", body = "ON  \u{B7}  waiting for Auto Steal to finish" }
        end
        if not S.inArena then
            local held = boss.held()
            if held and held.Open == true then
                return { title = "Auto fight", body = boss.autoEnterOn()
                    and "ON  \u{B7}  boss open - entering"
                    or "ON  \u{B7}  boss open - press Enter or turn on Auto enter" }
            end
            return { title = "Auto fight", body = "ON  \u{B7}  waiting for the boss world to open" }
        end
        if S.left then return { title = "Auto fight", body = "Boss dead  \u{B7}  leaving" } end
        local ph = S.phase
        if not ph then return { title = "Auto fight", body = "In the arena  \u{B7}  boss spawning" } end
        local what = S.kind and ("hitting the " .. S.kind) or "holding"
        return { title = "Auto fight",
                 body = ("Fighting  \u{B7}  %s  \u{B7}  %s  \u{B7}  %d swings"):format(ph, what, stats.swings) }
    end

    function M.setEnabled(on)
        on = on and true or false
        if on == enabled then return true end

        if not on then
            enabled = false
            if sc then sc:destroy() sc = nil end
            if S then
                S.goal, S.dodge, S.aim = nil, nil, nil
                setNoclip(false)
            end
            S = nil
            log.info("off (%d swings, %d kills this session)", stats.swings, stats.kills)
            return true
        end

        if not boss.isOn() then boss.setEnabled(true) end

        S = fresh()
        sc = BX.scope("features.bossfight")
        enabled = true

        sc:onFrame("mover", svc.RunService.Heartbeat, moverStep)
        sc:loop("fight", K.TICK, fightTick)
        sc:loop("void", K.VOID_GAP, voidTick)
        if K.DODGE then
            sc:loop("dodge", K.DODGE_GAP, function()
                if S.inArena then dodgeHazards() end
            end)
        end

        ch.onSpawn(sc, "bossfight.respawn", function()
            if not S then return end

            setNoclip(false)
            S.goal, S.dodge, S.aim, S.trackPos, S.batFor = nil, nil, nil, nil, nil
            S.lastSolid, S.arenaFloorY, S.left = nil, nil, false
            S.voidAnchor, S.voidMisses = nil, 0
            S.inArena, S.noclipped = false, false

            S.settleUntil = os.clock() + K.RESPAWN_SETTLE
        end)

        log.info("on (tick %.2fs, swing %.2fs, dodge %s) - waiting for the arena",
            K.TICK, K.SWING_GAP, K.DODGE and "on" or "off")
        return true
    end

    return M
end)

BX.module("features.prewarm", function(BX)
    local svc  = BX.require("core.services")
    local log  = BX.require("boot.log").for_module("prewarm")

    local M = {}

    local sc = nil
    local steps = {}      
    local done = false

    function M.report() return table.clone(steps) end
    function M.isDone() return done end

    local function record(name, ms, detail)
        steps[#steps + 1] = { name = name, ms = ms, detail = detail }
    end

    function M.start()
        if sc then return false end
        sc = BX.scope("features.prewarm")

        sc:spawn("warm", function()
            local t0 = os.clock()

            local grab = BX.require("features.grab")
            svc.RunService.Heartbeat:Wait()
            BX.try("prewarm.prompts", function()
                local ms, n = grab.warmPrompts()
                record("prompts", ms, n .. " prompts")
            end)

            local plot = BX.require("features.plot")
            svc.RunService.Heartbeat:Wait()
            BX.try("prewarm.safeZone", function()
                local s0 = os.clock()
                local _, via = plot.safeZone()
                record("safeZone", (os.clock() - s0) * 1000, tostring(via))
            end)

            svc.RunService.Heartbeat:Wait()
            BX.try("prewarm.plotHome", function()
                local s0 = os.clock()
                local _, via = plot.home()
                record("plotHome", (os.clock() - s0) * 1000, tostring(via))
            end)

            local bait = BX.require("features.bait")
            svc.RunService.Heartbeat:Wait()
            BX.try("prewarm.baitArea", function()
                local s0 = os.clock()
                local area = bait.firstAreaId(6)
                record("baitArea", (os.clock() - s0) * 1000, tostring(area))
            end)

            local move = BX.require("features.movement")
            local ch = BX.require("core.character")
            svc.RunService.Heartbeat:Wait()
            BX.try("prewarm.ground", function()
                local hrp = ch.root()
                if not hrp then record("ground", 0, "no character") return end
                local s0 = os.clock()
                local y = move.groundY(hrp.Position)
                record("ground", (os.clock() - s0) * 1000,
                    y and ("y=" .. ("%.0f"):format(y)) or "no hit")
            end)

            done = true

            local parts = {}
            local total = 0
            for _, s in ipairs(steps) do
                parts[#parts + 1] = ("%s=%.1fms(%s)"):format(s.name, s.ms, s.detail)
                total = total + s.ms
            end
            log.info("prewarmed in %.0fms wall, %.1fms of work: %s",
                (os.clock() - t0) * 1000, total, table.concat(parts, " "))
        end)

        return true
    end

    function M.stop()
        if not sc then return end
        sc:destroy()
        sc = nil
    end

    return M
end)

local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local SoundService = game:GetService("SoundService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "SAEGRR_HUB"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(235, 500)
main.Position = UDim2.new(0.5, -117, 0.5, -102)
main.BackgroundColor3 = Color3.fromRGB(5,9,16)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
main.Parent = gui
Instance.new("UICorner", main).CornerRadius = UDim.new(0, 10)

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2.5
stroke.Color = Color3.fromRGB(70,170,255)
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
stroke.Parent = main

local gradient = Instance.new("UIGradient")
gradient.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0,35,15)),
    ColorSequenceKeypoint.new(0.25, Color3.fromRGB(70,170,255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(190,255,215)),
    ColorSequenceKeypoint.new(0.75, Color3.fromRGB(70,170,255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(0,35,15))
})
gradient.Parent = stroke

local glow = Instance.new("UIStroke")
glow.Thickness = 7
glow.Transparency = 0.72
glow.Color = Color3.fromRGB(70,170,255)
glow.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
glow.Parent = main

task.spawn(function()
    while gui.Parent do
        gradient.Rotation = (gradient.Rotation + 3) % 360
        task.wait()
    end
end)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1,-90,0,24)
title.Position = UDim2.fromOffset(10,7)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.Text = "SAEGRR HUB"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.TextSize = 15
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = main

local made = Instance.new("TextLabel")
made.Size = UDim2.new(1,-20,0,15)
made.Position = UDim2.fromOffset(10,30)
made.BackgroundTransparency = 1
made.Font = Enum.Font.Gotham
made.Text = "BLUE GLASS • SAEGRR"
made.TextColor3 = Color3.fromRGB(70,170,255)
made.TextSize = 8
made.TextXAlignment = Enum.TextXAlignment.Left
made.Parent = main

local lockButton = Instance.new("TextButton")
lockButton.Size = UDim2.fromOffset(52,22)
lockButton.Position = UDim2.new(1,-61,0,7)
lockButton.BackgroundColor3 = Color3.fromRGB(10,22,35)
lockButton.BorderSizePixel = 0
lockButton.Font = Enum.Font.GothamBold
lockButton.Text = "LOCK"
lockButton.TextColor3 = Color3.fromRGB(70,170,255)
lockButton.TextSize = 8
lockButton.Parent = main
Instance.new("UICorner",lockButton).CornerRadius=UDim.new(0,6)

local locked=false
lockButton.MouseButton1Click:Connect(function()
    locked=not locked
    main.Active=not locked
    main.Draggable=not locked
    lockButton.Text=locked and "LOCKED" or "LOCK"
end)

local function makeButton(text, y, h)
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,-20,0,h or 29)
    b.Position=UDim2.fromOffset(10,y)
    b.BackgroundColor3=Color3.fromRGB(20,85,145)
    b.BorderSizePixel=0
    b.Font=Enum.Font.GothamBold
    b.Text=text
    b.TextColor3=Color3.fromRGB(255,255,255)
    b.TextSize=10
    b.Parent=main
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,7)
    return b
end

local find=makeButton("Find Low Server",50,29)

local speedRow=Instance.new("Frame")
speedRow.Size=UDim2.new(1,-20,0,29)
speedRow.Position=UDim2.fromOffset(10,84)
speedRow.BackgroundColor3=Color3.fromRGB(13,28,45)
speedRow.BorderSizePixel=0
speedRow.Parent=main
Instance.new("UICorner",speedRow).CornerRadius=UDim.new(0,7)

local speedLabel=Instance.new("TextLabel")
speedLabel.Size=UDim2.new(0.48,0,1,0)
speedLabel.Position=UDim2.fromOffset(8,0)
speedLabel.BackgroundTransparency=1
speedLabel.Font=Enum.Font.GothamBold
speedLabel.Text="Tween Speed"
speedLabel.TextColor3=Color3.fromRGB(255,255,255)
speedLabel.TextSize=9
speedLabel.TextXAlignment=Enum.TextXAlignment.Left
speedLabel.Parent=speedRow

local speedBox=Instance.new("TextBox")
speedBox.Size=UDim2.new(0.22,0,1,0)
speedBox.Position=UDim2.new(0.52,0,0,0)
speedBox.BackgroundTransparency=1
speedBox.Font=Enum.Font.GothamBold
speedBox.Text="650"
speedBox.TextColor3=Color3.fromRGB(70,170,255)
speedBox.TextSize=9
speedBox.ClearTextOnFocus=false
speedBox.Parent=speedRow

local speedToggle=Instance.new("TextButton")
speedToggle.Size=UDim2.new(0.23,-4,1,-6)
speedToggle.Position=UDim2.new(0.77,0,0,3)
speedToggle.BackgroundColor3=Color3.fromRGB(35,45,38)
speedToggle.BorderSizePixel=0
speedToggle.Font=Enum.Font.GothamBold
speedToggle.Text="OFF"
speedToggle.TextColor3=Color3.fromRGB(255,255,255)
speedToggle.TextSize=8
speedToggle.Parent=speedRow
Instance.new("UICorner",speedToggle).CornerRadius=UDim.new(0,5)

local tweenSpeed=650
local tweenEnabled=false
speedBox.FocusLost:Connect(function()
    local n=tonumber(speedBox.Text)
    if n and n>0 and n<=1000 then
        tweenSpeed=n
        speedBox.Text=tostring(n)
    else
        speedBox.Text=tostring(tweenSpeed)
    end
end)

speedToggle.MouseButton1Click:Connect(function()
    tweenEnabled=not tweenEnabled
    speedToggle.Text=tweenEnabled and "ON" or "OFF"
    speedToggle.BackgroundColor3=tweenEnabled and Color3.fromRGB(25,105,180) or Color3.fromRGB(35,45,38)
end)

local mapsTitle=Instance.new("TextLabel")
mapsTitle.Size=UDim2.new(1,-20,0,16)
mapsTitle.Position=UDim2.fromOffset(10,117)
mapsTitle.BackgroundTransparency=1
mapsTitle.Font=Enum.Font.GothamBold
mapsTitle.Text="AREAS"
mapsTitle.TextColor3=Color3.fromRGB(110,200,255)
mapsTitle.TextSize=9
mapsTitle.TextXAlignment=Enum.TextXAlignment.Left
mapsTitle.Parent=main

local mapScroll=Instance.new("ScrollingFrame")
mapScroll.Size=UDim2.new(1,-20,0,62)
mapScroll.Position=UDim2.fromOffset(10,136)
mapScroll.BackgroundTransparency=1
mapScroll.BorderSizePixel=0
mapScroll.ScrollBarThickness=2
mapScroll.CanvasSize=UDim2.fromOffset(0,0)
mapScroll.Parent=main

local mapLayout=Instance.new("UIListLayout")
mapLayout.Padding=UDim.new(0,4)
mapLayout.Parent=mapScroll

local MapLocations={
    {Name="Cherry Blossom",Pos=Vector3.new(4032.399,70.767,-382.600)},
    {Name="Cosmic Area",Pos=Vector3.new(3388.949,70.767,-339.276)},
    {Name="Titan Temple",Pos=Vector3.new(4798.121,70.767,-344.987)}
}

local moving=false
local moveToken=0

local function getHumanoid()
    local c=player.Character
    return c and c:FindFirstChildOfClass("Humanoid")
end

local function moveDirect(targetPos, myToken)
    local hum=getHumanoid()
    local char=player.Character
    local root=char and char:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return false end

    hum.WalkSpeed=tweenSpeed

    local safeY=root.Position.Y
    local waypoint=Vector3.new(root.Position.X, safeY, targetPos.Z)
    local finalPos=Vector3.new(targetPos.X, safeY, targetPos.Z)

    hum:MoveTo(waypoint)
    while myToken==moveToken and player.Character==char and root.Parent and
          (Vector3.new(root.Position.X,0,root.Position.Z)-Vector3.new(waypoint.X,0,waypoint.Z)).Magnitude > 5 do
        hum.WalkSpeed=tweenSpeed
        RunService.Heartbeat:Wait()
    end

    if myToken~=moveToken or player.Character~=char then return false end

    hum:MoveTo(finalPos)
    while myToken==moveToken and player.Character==char and root.Parent and
          (Vector3.new(root.Position.X,0,root.Position.Z)-Vector3.new(finalPos.X,0,finalPos.Z)).Magnitude > 5 do
        hum.WalkSpeed=tweenSpeed
        RunService.Heartbeat:Wait()
    end

    if myToken==moveToken and player.Character==char then
        hum:Move(Vector3.zero,false)
        hum:MoveTo(root.Position)
    end
    return myToken==moveToken
end

local function moveToPosition(pos)
    moveToken += 1
    local myToken=moveToken
    local hum=getHumanoid()
    local root=player.Character and player.Character:FindFirstChild("HumanoidRootPart")
    if not hum or not root then return end

    moveDirect(pos,myToken)
end

for _,info in ipairs(MapLocations) do
    local b=Instance.new("TextButton")
    b.Size=UDim2.new(1,-2,0,26)
    b.BackgroundColor3=Color3.fromRGB(12,55,95)
    b.BorderSizePixel=0
    b.Font=Enum.Font.GothamBold
    b.Text=info.Name
    b.TextColor3=Color3.fromRGB(225,245,255)
    b.TextSize=9
    b.Parent=mapScroll
    Instance.new("UICorner",b).CornerRadius=UDim.new(0,6)
    b.MouseButton1Click:Connect(function()
        if moving then return end
        moving=true
        b.Text="Moving..."
        task.spawn(function()
            local ok = pcall(function() moveToPosition(info.Pos) end)
            b.Text=info.Name
            moving=false
        end)
    end)
end

mapLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    mapScroll.CanvasSize=UDim2.fromOffset(0,mapLayout.AbsoluteContentSize.Y)
end)

local menuButton=Instance.new("TextButton")
menuButton.Size=UDim2.fromOffset(70,28)
menuButton.Position=UDim2.new(0,10,0.5,-14)
menuButton.BackgroundColor3=Color3.fromRGB(5,9,16)
menuButton.BorderSizePixel=0
menuButton.Font=Enum.Font.GothamBold
menuButton.Text="SAEGRR"
menuButton.TextColor3=Color3.fromRGB(220,245,255)
menuButton.TextSize=9
menuButton.Active=true
menuButton.Draggable=true
menuButton.Parent=gui
Instance.new("UICorner",menuButton).CornerRadius=UDim.new(0,7)

local menuStroke=Instance.new("UIStroke")
menuStroke.Thickness=2
menuStroke.Color=Color3.fromRGB(70,170,255)
menuStroke.Parent=menuButton

local visible=true
menuButton.MouseButton1Click:Connect(function()
    visible=not visible
    main.Visible=visible
end)

local searching=false
find.MouseButton1Click:Connect(function()
    if searching then return end
    searching=true
    find.Text="Searching..."
    task.spawn(function()
        local ok,response=pcall(function()
            local placeId=tostring(game.PlaceId)
            local url="https://games.roblox.com/v1/games/"..placeId..
                "/servers/Public?sortOrder=Asc&limit=100&excludeFullGames=true"
            return game:HttpGet(url)
        end)

        if not ok then
            find.Text="HTTP Error"
            task.wait(1.2)
            find.Text="Find Low Server"
            searching=false
            return
        end

        local decodedOk,data=pcall(function()
            return HttpService:JSONDecode(response)
        end)

        if not decodedOk or not data or not data.data then
            find.Text="No Data"
            task.wait(1.2)
            find.Text="Find Low Server"
            searching=false
            return
        end

        local best=nil
        for _,server in ipairs(data.data) do
            if server.id~=game.JobId and (server.playing or 0)<(server.maxPlayers or math.huge) then
                if not best or (server.playing or math.huge)<(best.playing or math.huge)
                    or ((server.playing or math.huge)==(best.playing or math.huge)
                    and (server.ping or math.huge)<(best.ping or math.huge)) then
                    best=server
                end
            end
        end

        if best then
            find.Text="Teleporting..."
            pcall(function()
                TeleportService:TeleportToPlaceInstance(game.PlaceId,best.id,player)
            end)
        else
            find.Text="No Low Server"
            task.wait(1.2)
        end

        find.Text="Find Low Server"
        searching=false
    end)
end)

local intro=Instance.new("TextLabel")
intro.Size=UDim2.new(1,0,0,20)
intro.Position=UDim2.new(0,0,0,-24)
intro.BackgroundTransparency=1
intro.Font=Enum.Font.GothamBold
intro.Text="BLUE GLASS • SAEGRR HUB"
intro.TextColor3=Color3.fromRGB(70,170,255)
intro.TextSize=11
intro.TextTransparency=1
intro.Parent=main

TweenService:Create(intro,TweenInfo.new(0.4),{TextTransparency=0}):Play()

local introMusic=Instance.new("Sound")
introMusic.Name="GreenGiantIntro"
introMusic.SoundId="rbxassetid://99586556494806"
introMusic.Volume=0.55
introMusic.Looped=false
introMusic.Parent=SoundService
pcall(function() introMusic:Play() end)

task.delay(3,function()
    if intro and intro.Parent then
        TweenService:Create(intro,TweenInfo.new(0.35),{TextTransparency=1}):Play()
    end
    if introMusic and introMusic.Parent then
        introMusic:Destroy()
    end
end)

do
    local ok, err = pcall(function()
        local filter = BX.require("features.farm.filter")
        local auto   = BX.require("features.autosteal")
        local hold   = BX.require("features.farm.treadmill_on")
        local boss   = BX.require("features.boss")
        local fight  = BX.require("features.bossfight")
        local eggs   = BX.require("features.eggs")
        local move   = BX.require("features.movement")

        main.ClipsDescendants = false

        local featurePanel = Instance.new("ScrollingFrame")
        featurePanel.Size = UDim2.new(1,-20,0,275)
        featurePanel.Position = UDim2.fromOffset(10,205)
        featurePanel.BackgroundTransparency = 1
        featurePanel.BorderSizePixel = 0
        featurePanel.ScrollBarThickness = 2
        featurePanel.CanvasSize = UDim2.fromOffset(0,0)
        featurePanel.Parent = main
        featurePanel.ZIndex = 3

        local layout = Instance.new("UIListLayout")
        layout.Padding = UDim.new(0,5)
        layout.Parent = featurePanel

        local function section(text)
            local l=Instance.new("TextLabel")
            l.Size=UDim2.new(1,0,0,18)
            l.BackgroundTransparency=1
            l.Font=Enum.Font.GothamBold
            l.Text=text
            l.TextColor3=Color3.fromRGB(80,185,255)
            l.TextSize=9
            l.TextXAlignment=Enum.TextXAlignment.Left
            l.Parent=featurePanel
            return l
        end

        local function button(text, cb)
            local b=Instance.new("TextButton")
            b.Size=UDim2.new(1,0,0,29)
            b.BackgroundColor3=Color3.fromRGB(12,48,78)
            b.BorderSizePixel=0
            b.Font=Enum.Font.GothamBold
            b.Text=text
            b.TextColor3=Color3.fromRGB(230,245,255)
            b.TextSize=9
            b.Parent=featurePanel
            Instance.new("UICorner",b).CornerRadius=UDim.new(0,7)
            local st=Instance.new("UIStroke",b); st.Thickness=1; st.Color=Color3.fromRGB(55,145,220)
            b.MouseButton1Click:Connect(function() pcall(cb) end)
            return b
        end

        local function toggle(text, cb)
            local on=false
            local b=button(text.."  [OFF]", function()
                on=not on
                b.Text=text..(on and "  [ON]" or "  [OFF]")
                b.BackgroundColor3=on and Color3.fromRGB(18,95,155) or Color3.fromRGB(12,48,78)
                local ok2,e=pcall(function() cb(on) end)
                if not ok2 then on=not on; b.Text=text..(on and "  [ON]" or "  [OFF]") end
            end)
            return b
        end

        local function popupSelect(titleText, options, multi, onChanged)
            local holder=Instance.new("Frame")
            holder.Size=UDim2.new(1,0,0,31)
            holder.BackgroundTransparency=1
            holder.Parent=featurePanel
            local b=Instance.new("TextButton",holder)
            b.Size=UDim2.new(1,0,1,0); b.BackgroundColor3=Color3.fromRGB(10,38,63); b.BorderSizePixel=0
            b.Font=Enum.Font.GothamBold; b.Text=titleText.."  ▼"; b.TextColor3=Color3.fromRGB(225,245,255); b.TextSize=9
            Instance.new("UICorner",b).CornerRadius=UDim.new(0,7)
            local popup=Instance.new("Frame",holder)
            popup.Position=UDim2.new(0,0,1,3); popup.Size=UDim2.new(1,0,0,0); popup.BackgroundColor3=Color3.fromRGB(5,16,28); popup.BorderSizePixel=0; popup.Visible=false; popup.ZIndex=20
            Instance.new("UICorner",popup).CornerRadius=UDim.new(0,7)
            local list=Instance.new("ScrollingFrame",popup); list.Size=UDim2.new(1,-6,1,-6); list.Position=UDim2.fromOffset(3,3); list.BackgroundTransparency=1; list.BorderSizePixel=0; list.ScrollBarThickness=2; list.ZIndex=21
            local lay=Instance.new("UIListLayout",list); lay.Padding=UDim.new(0,2)
            local selected={}
            local function rebuildText()
                local arr={}; for k,v in pairs(selected) do if v then arr[#arr+1]=k end end
                table.sort(arr)
                b.Text=titleText..( #arr>0 and (": "..table.concat(arr,", ")) or ": ANY")
            end
            for _,opt in ipairs(options or {}) do
                local label=type(opt)=="table" and opt.label or tostring(opt)
                local id=type(opt)=="table" and opt.id or label
                local ob=Instance.new("TextButton",list); ob.Size=UDim2.new(1,-2,0,25); ob.BackgroundColor3=Color3.fromRGB(10,31,50); ob.BorderSizePixel=0; ob.Font=Enum.Font.Gotham; ob.Text=label; ob.TextColor3=Color3.fromRGB(220,240,255); ob.TextSize=8; ob.ZIndex=22
                Instance.new("UICorner",ob).CornerRadius=UDim.new(0,5)
                ob.MouseButton1Click:Connect(function()
                    if multi then selected[id]=not selected[id] else selected={ [id]=true }; popup.Visible=false end
                    local ids={}; for k,v in pairs(selected) do if v then ids[#ids+1]=k end end
                    pcall(function() onChanged(ids) end); rebuildText()
                end)
            end
            lay:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() list.CanvasSize=UDim2.fromOffset(0,lay.AbsoluteContentSize.Y) end)
            b.MouseButton1Click:Connect(function()
                popup.Visible=not popup.Visible
                local h=math.min(150,math.max(30,lay.AbsoluteContentSize.Y+6)); popup.Size=UDim2.new(1,0,0,h)
            end)
            return holder
        end

        section("EGG FILTERS")
        local areaRows=filter.areaOptions()
        local areaMap={}
        for _,r in ipairs(areaRows) do areaMap[r.id]=r.label end
        popupSelect("AREAS",areaRows,true,function(ids) filter.setAreas(ids) end)
        local rarityRows=filter.rarityOptions()
        popupSelect("RARITIES",rarityRows,true,function(ids) filter.setRarities(ids) end)
        popupSelect("TARGET BY",filter.targetByOptions(),false,function(v) filter.setTargetBy(v[1]) end)
        button("REFRESH EGGS",function()
            eggs.invalidate("SAEGRR UI refresh")
            eggs.list({},true)
        end)

        section("AUTO FARM")
        toggle("AUTO STEAL",function(on)
            if on and hold.isOn() then hold.setEnabled(false) end
            if on then auto.setOptions("farm",{pick=filter.pick,continuous=true}) end
            auto.setEnabled(on,"farm")
        end)
        toggle("STAY IN TREADMILL",function(on) hold.setEnabled(on) end)

        section("BOSS")
        local status=Instance.new("TextLabel")
        status.Size=UDim2.new(1,0,0,24); status.BackgroundTransparency=1; status.Font=Enum.Font.Gotham; status.Text="Abyss Overlord: Reading..."; status.TextColor3=Color3.fromRGB(155,205,240); status.TextSize=8; status.TextWrapped=true; status.Parent=featurePanel
        button("ENTER THE BOSS WORLD",function() local ok,msg=boss.enter(); status.Text="Abyss Overlord: "..tostring(msg) end)
        toggle("AUTO ENTER",function(on) boss.setAutoEnter(on); if on and not boss.isOn() then boss.setEnabled(true) end end)
        toggle("AUTO FIGHT",function(on) fight.setEnabled(on) end)

        section("TP SPEED")
        local speedBox=Instance.new("TextBox",featurePanel)
        speedBox.Size=UDim2.new(1,0,0,30); speedBox.BackgroundColor3=Color3.fromRGB(8,28,48); speedBox.BorderSizePixel=0; speedBox.ClearTextOnFocus=false; speedBox.Font=Enum.Font.GothamBold; speedBox.Text="1000"; speedBox.TextColor3=Color3.fromRGB(100,195,255); speedBox.PlaceholderText="40 - 1000 MAX"; speedBox.TextSize=9
        Instance.new("UICorner",speedBox).CornerRadius=UDim.new(0,7)
        speedBox.FocusLost:Connect(function()
            local n=math.clamp(math.floor(tonumber(speedBox.Text) or 1000),40,1000)
            speedBox.Text=tostring(n)
            pcall(function() move.setSpeed(n) end)
        end)
        pcall(function() move.setSpeed(1000) end)

        layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() featurePanel.CanvasSize=UDim2.fromOffset(0,layout.AbsoluteContentSize.Y+6) end)
    end)
    if not ok then warn("SAEGRR imported features UI error: ",err) end
end
