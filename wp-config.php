<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'sinevert_shop' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', '' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8mb4' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',         '(+Fz:=iGEM_TSNTb/,}t%5P_A^^ v bF)T=@^IK0[ek57%pth*E~SQAJ0oLxr,.d' );
define( 'SECURE_AUTH_KEY',  '.,.0.e-X1@dW-prs.,c=Vba+AFH&>mo}!U+>eB]c~*()a=Qv&+iloVs=B[/%Cz &' );
define( 'LOGGED_IN_KEY',    '!s8lR-@L~y28L^AR/,IQeaW(?%0NO= |m;$EK}}`SYQbO~KU3l#>eQlX?L/g `>:' );
define( 'NONCE_KEY',        'QWGR/a[||^|G@&Bhpr6@8TvxlA{!QyVF84dwaVHF#=CDu$Km{%_q]G0HBr,Fy:^:' );
define( 'AUTH_SALT',        '[TBYY~sMy~Vn9 /f>`+]^:}jt.3;nH<?sZif`ucYn]fi,lb3W[.7WW8(3A^`qFwZ' );
define( 'SECURE_AUTH_SALT', 'F,lLP@M.,Q{O8)$:,ZEX|H9ZEi.gs[*f2Z:3+/uhuOW%VoEx@u5bs>!1Y8D&9t[C' );
define( 'LOGGED_IN_SALT',   'DA2K6aKhpy]]&+2X8@q2q$l@5.2BZ]@26$L4+|.=da>upsq{.OWB]EgV.rfc^^/;' );
define( 'NONCE_SALT',       ';#JGv]1&2YCW52z6kx/kg$RGm;grVzzyf>UD]pqw92MJcIXz]:C[ZRzm<g}@w5|/' );

/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'sv_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
