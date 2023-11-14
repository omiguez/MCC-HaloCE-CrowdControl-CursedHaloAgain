(global long crowdControlLandmark 777888999) ; these help the trainer locate the crowd control code
(global long crowdControlCode 878095309) ; 0x3456ABCD, this gets changed by the trainer
(global long crowdControlLandmark2 987654321); these help the trainer locate the crowd control code
(global short ccEffectDuration 0); In game frames (30 per second).
(global short ccEffectCode 0)

;Used for the Malfunction and HUD technician effects.
(global boolean disabledCrosshairUI false)
(global boolean disabledHealthUI false)
(global boolean disabledShieldUI false)
(global boolean disabledMotionSensorUI false)
(global boolean uiPartDisabledOrRepaired false)
(global boolean flappySpartanOngoing false)
(script continuous crowdControl
    (if (= crowdControlCode 0) (print "")); used only to force a reading on the crowdControlVariable. This is required to have the variables be in the expected order.
    (set ccEffectDuration (bitwise_right_shift crowdControlCode 16))
    (set ccEffectCode (bitwise_and crowdControlCode 65535))
    
    (if (= ccEffectCode 001)
        (begin
            (unit_kill (unit (list_get (players) 0)))
        )
    )
    (if (= ccEffectCode 002)        
        (begin 
            (set crowdControlLandmark (+ ccEffectDuration 0)) ; temp. Test of the var passing.
        )
    )
    (if (= ccEffectCode 004)
        (begin
            (map_reset)
        )
    )
    (if (= ccEffectCode 005)
        (begin
            (cheat_all_vehicles)
        )
    )
    (if (= ccEffectCode 008)
        (begin
            (game_won)
        )
    )
    (if (= ccEffectCode 010)
        (begin
            (hud_show_crosshair false)
            (set disableDCrosshairUI true)
        )
    )
    (if (= ccEffectCode 011)
        (begin 
            (sound_impulse_start twitch\sounds\crowdControl\malfunction none 1)
            (set uiPartDisabledOrRepaired false)
            ; try to set one at random, and use a flag var to verify if you could.
            (begin_random
                (if (and (not disabledCrosshairUI) (not uiPartDisabledOrRepaired))   (begin (hud_show_crosshair false) (set disableDCrosshairUI true) (set uiPartDisabledOrRepaired true)))
                (if (and (not disabledHealthUI) (not uiPartDisabledOrRepaired))       (begin (hud_show_health false) (set disabledHealthUI true) (set uiPartDisabledOrRepaired true)))
                (if (and (not disabledShieldUI) (not uiPartDisabledOrRepaired))       (begin (hud_show_shield false) (set disabledShieldUI true) (set uiPartDisabledOrRepaired true)))
                (if (and (not disabledMotionSensorUI) (not uiPartDisabledOrRepaired)) (begin (hud_show_motion_sensor false) (set disabledMotionSensorUI true) (set uiPartDisabledOrRepaired true)))
            )
            (set uiPartDisabledOrRepaired false)
        )
    )
    (if (= ccEffectCode 014)
        (begin
            (sound_impulse_start twitch\sounds\crowdControl\repairHud none 1)
            (set uiPartDisabledOrRepaired false)
            ; try to set one at random, and use a flag var to verify if you could.
            (begin_random
                (if (and disabledCrosshairUI (not uiPartDisabledOrRepaired))   (begin (hud_show_crosshair true) (set disableDCrosshairUI false) (set uiPartDisabledOrRepaired true)))
                (if (and disabledHealthUI (not uiPartDisabledOrRepaired))      (begin (hud_show_health true) (set disabledHealthUI false) (set uiPartDisabledOrRepaired true)))
                (if (and disabledShieldUI (not uiPartDisabledOrRepaired))      (begin (hud_show_shield true) (set disabledShieldUI false) (set uiPartDisabledOrRepaired true)))
                (if (and disabledMotionSensorUI (not uiPartDisabledOrRepaired)) (begin (hud_show_motion_sensor true) (set disabledMotionSensorUI false) (set uiPartDisabledOrRepaired true)))
            )
            (set uiPartDisabledOrRepaired false)
        )
    )    
    (if (= ccEffectCode 015)
        (game_save_no_timeout)
    )
    (if (= ccEffectCode 016)
        (game_save_totally_unsafe)
    )
    (if (= ccEffectCode 017)
        (fx_dave)
    )
    (if (= ccEffectCode 018)
        (fx_minecraft)
    )
    (if (= ccEffectCode 019)
        (fx_hunter)
    )
    (if (= ccEffectCode 020)
        (fx_turret)
    )
    (if (= ccEffectCode 021)
        (fx_johnson)
    )
    (if (= ccEffectCode 022)
        (fx_piss)
    )
    (if (= ccEffectCode 023)
        (fx_steve)
    )
    (if (= ccEffectCode 024)
        (begin
            (sound_impulse_start twitch\sounds\crowdControl\doubleup none 1)
            (fx_doubleup)                
        )
    )
    (if (= ccEffectCode 025)
        (fx_friend)
    )
    (if (= ccEffectCode 026)
        (fx_foe)
    )
    (if (= ccEffectCode 027)
        (fx_shrink)
    )
    (if (= ccEffectCode 028)
        (fx_scream)
    )
    (if (= ccEffectCode 029)
        (fx_boing)
    )
    (if (= ccEffectCode 030)
        (begin_random 
            (fx_loadout fx_loadout00)
            (fx_loadout fx_loadout01)
            (fx_loadout fx_loadout02)
            (fx_loadout fx_loadout03)
            (fx_loadout fx_loadout04)
            (fx_loadout fx_loadout05)
            (fx_loadout fx_loadout06)
            (fx_loadout fx_loadout07)
            (fx_loadout fx_loadout08)
            (fx_loadout fx_loadout09)
            (fx_loadout fx_loadout10)
            (fx_loadout fx_loadout11)
            (fx_loadout fx_loadout12)
        )
    )
    (if (= ccEffectCode 031)
        (fx_invis)
    )
    (if (= ccEffectCode 032)
        (fx_d20)
    )
    (if (= ccEffectCode 033)
        (fx_blackhole)
    )
    (if (= ccEffectCode 034)
        (fx_vehicle)
    )
    (if (= ccEffectCode 035)
        (fx_nuke)
    )
    (if (= ccEffectCode 036)
        (fx_toolgun)
    )
    (if (= ccEffectCode 037)
        (fx_jump_upgrade)
    )
    (if (= ccEffectCode 038)
        (fx_head_upgrade)
    )
    ; here start effects with a duration
    (if (= ccEffectCode 039)
        (fx_infinite (+ ccEffectDuration 0))
    )
    (if (= ccEffectCode 040)
        (fx_moon (+ ccEffectDuration 0))
    )
    (if (= ccEffectCode 041)
        (fx_rapture (+ ccEffectDuration 0))
    )
    (if (= ccEffectCode 042)
        (fx_joyride (+ ccEffectDuration 0))
    )
    (if (= ccEffectCode 043)
        (begin 
            (fx_dance (+ ccEffectDuration 0))
            (sound_impulse_start twitch\music\haloSynthwave none 1)
        )
    )
    (if (= ccEffectCode 044)
        (fx_lock (+ ccEffectDuration 0))
    )
    (if (= ccEffectCode 045)
        (fx_reverse (+ ccEffectDuration 0))
    )
    (if (= ccEffectCode 046)
        (begin 
            (fx_berserk (+ ccEffectDuration 0))
            (sound_impulse_start twitch\music\berserker none 1))
    )
    (if (= ccEffectCode 047)
        (fx_cooldown (+ ccEffectDuration 0));
    )
    (if (= ccEffectCode 048); stormy night: fade out
        (begin 
            (sound_impulse_start twitch\sounds\crowdControl\thunder none 1)
            (fade_out 0.0 0.0 0.0 90) )
    )
    (if (= ccEffectCode 049); stormy night: fade in
        (fade_in 1.0 1.0 1.0 10)
    )
    (if (= ccEffectCode 050); paranoia: start
        (begin                 
                (hud_blink_health true)
                (hud_blink_motion_sensor true)
                (hud_blink_shield true))
    )
    (if (= ccEffectCode 051); paranoia: flaslight on
        (units_set_desired_flashlight_state (players) true)
    )
    (if (= ccEffectCode 052); paranoia: flaslight off
        (units_set_desired_flashlight_state (players) false)
    )
    (if (= ccEffectCode 053); paranoia: end
        (begin                 
                (hud_blink_health false)
                (hud_blink_motion_sensor false)
                (hud_blink_shield false))
    )
    (if (= ccEffectCode 054); flappy spartan begin
        (begin
            (physics_set_gravity (/ (random_range 0 200) 100))
            (set flappySpartanOngoing true))
    )
    (if (= ccEffectCode 055); flappy spartan end
        (begin
            (physics_set_gravity 1)
            (set flappySpartanOngoing false)
        )        
    )
    (if (= ccEffectCode 058); flappy spartan update
        (begin
            (physics_set_gravity (- (/ (random_range 0 500) 100) 1)))
    )

    (if (= ccEffectCode 056) ; spawn a keyes with a remover toolgun
        (fx_captain)
    )
    (if (= ccEffectCode 057) ; spawn a keyes with a remover toolgun
        (fx_rat)
    )

    ; ------------------- sounds start at this index
    (if (= ccEffectcode 1000)
        (sound_impulse_start twitch\sounds\crowdControl\1hp none 1))
    (if (= ccEffectcode 1001)
        (sound_impulse_start twitch\sounds\crowdControl\doubleup none 1))
    (if (= ccEffectcode 1002)
        (sound_impulse_start twitch\sounds\crowdControl\fullestauto none 1))
    (if (= ccEffectcode 1003)
        (sound_impulse_start twitch\sounds\crowdControl\give none 1))
    (if (= ccEffectcode 1004)
        (sound_impulse_start twitch\sounds\crowdControl\heal none 1))
    (if (= ccEffectcode 1005)
        (sound_impulse_start twitch\sounds\crowdControl\healingBullets none 1))
    (if (= ccEffectcode 1006)
        (sound_impulse_start twitch\sounds\crowdControl\heavenOrHell none 1))
    (if (= ccEffectcode 1007)
        (sound_impulse_start twitch\sounds\crowdControl\malfunction none 1))
    (if (= ccEffectcode 1008)
        (sound_impulse_start twitch\sounds\crowdControl\quadDamage none 1))
    (if (= ccEffectcode 1009)
        (sound_impulse_start twitch\sounds\crowdControl\repairHud none 1))
    (if (= ccEffectcode 1010)
        (sound_impulse_start twitch\sounds\crowdControl\yoink none 1))
    (if (= ccEffectcode 1011)
        (sound_impulse_stop twitch\sounds\crowdControl\fullestauto))
    (if (= ccEffectcode 1012)
        (sound_impulse_start twitch\music\berserker none 1))
    ; (if (= ccEffectcode 1013)
    ;     (sound_impulse_stop twitch\music\berserker))
    (if (= ccEffectcode 1014)
        (sound_impulse_start twitch\sounds\crowdControl\crickets none 1))
    (if (= ccEffectcode 1015)
        (sound_impulse_start twitch\sounds\crowdControl\bodySnatcher none 1))
    (if (= ccEffectcode 1016)
        (sound_impulse_start twitch\sounds\crowdControl\deathless none 1))
    (if (= ccEffectcode 1017)
        (sound_impulse_start twitch\sounds\crowdControl\enemyGodMode none 1))
    (if (= ccEffectcode 1018)
        (sound_impulse_start twitch\sounds\crowdControl\friendly none 1))
    (if (= ccEffectcode 1019)
        (sound_impulse_start twitch\sounds\crowdControl\glassCannon none 1))
    (if (= ccEffectcode 1020)
        (sound_impulse_start twitch\sounds\crowdControl\godMode none 1))
    (if (= ccEffectcode 1021)
        (sound_impulse_start twitch\sounds\crowdControl\highGravity none 1))
    (if (= ccEffectcode 1022)
        (sound_impulse_start twitch\sounds\crowdControl\jetpack none 1))
    (if (= ccEffectcode 1023)
        (sound_impulse_start twitch\sounds\crowdControl\lowGravity none 1))
    (if (= ccEffectcode 1024)
        (sound_impulse_start twitch\sounds\crowdControl\medusa none 1))
    (if (= ccEffectcode 1025)
        (sound_impulse_start twitch\sounds\crowdControl\nerfWar none 1))
    (if (= ccEffectcode 1026)
        (sound_impulse_start twitch\sounds\crowdControl\oneShotOneKill none 1))
    (if (= ccEffectcode 1027)
        (sound_impulse_start twitch\sounds\crowdControl\publicEnemy none 1))
    (if (= ccEffectcode 1028)
        (sound_impulse_start twitch\sounds\crowdControl\superJump none 1))
    (if (= ccEffectcode 1029)
        (sound_impulse_start twitch\sounds\crowdControl\unlimitedAmmo none 1))
    (if (= ccEffectcode 1030)
        (sound_impulse_start twitch\music\haloSynthwave none 1))

    (set crowdControlCode 878095309); reset the variable
)