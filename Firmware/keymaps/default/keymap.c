// Copyright 2023 QMK
// SPDX-License-Identifier: GPL-2.0-or-later

#include QMK_KEYBOARD_H

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
        /*
         * ┌───┬───┬───┐
         * │ 7 │ 8 │ 9 │
         * ├───┼───┼───┤
         * │ 4 │ 5 │ 6 │
         * ├───┼───┼───┤
         * │ 1 │ 2 │ 3 │
         * ├───┼───┼───┤
         * │ 0 │Ent│Esc│
         * └───┴───┴───┘
         */
    [0] = LAYOUT(
        KC_7, KC_8, KC_9,
        KC_4, KC_5, KC_6,
        KC_1, KC_2, KC_3,
        KC_0, KC_ENT, KC_ESC
    )
};
