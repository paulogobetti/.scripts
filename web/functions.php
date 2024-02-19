<?php

// Desabilitar editores GUI.
define('DISALLOW_FILE_EDIT', true);

// Desabilitar App Passwords.
add_filter('wp_is_application_passwords_available', '__return_false');

// X-Content-Type-Options
header('X-Content-Type-Options: nosniff');

// X-XSS-Protection
header('X-XSS-Protection: 1; mode=block');

// Strict-Transport-Security
header('Strict-Transport-Security: max-age=31536000;');

// Referrer-Policy
header('Referrer-Policy: same-origin');

// Permissions-Policy
header("Permissions-Policy: accelerometer 'none' ; ambient-light-sensor 'none' ; autoplay 'none' ; camera 'none' ; encrypted-media 'none' ; fullscreen 'none' ; geolocation 'none' ; gyroscope 'none' ; magnetometer 'none' ; microphone 'none' ; midi 'none' ; payment 'none' ; speaker 'none' ; sync-xhr 'none' ; usb 'none' ; notifications 'none' ; vibrate 'none' ; push 'none' ; vr 'none' ");

