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
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'mmasstou' );

/** Database password */
define( 'DB_PASSWORD', 'mmasstou0123' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

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
define( 'AUTH_KEY',          'mk|1(6Ld)TYm,5C@I-@eK^Eg[l+]-D$@J,=0D&+p|l:^J7euvr$PF4g&QD.>;0bF' );
define( 'SECURE_AUTH_KEY',   '+W!#z{>6s;X)kNr_~!HO^qoL.kQ.Gy:ovnK|k7FJRJ>arcD]K`[]0EUshW`.aLl&' );
define( 'LOGGED_IN_KEY',     'tR2jdyXJ5}C-oZ(iZ.C[wp6(j8nZo@B^%*^kUbSLTfgf>yuN[J.~#?!r.hz 8??!' );
define( 'NONCE_KEY',         'G_F)drb_+EMQ3O3K&m_Q/EUgn{QF;vSKFFM<;z3(#W{j(- -r_Dp55] ,QYyM07I' );
define( 'AUTH_SALT',         'CZ+=` 99hMWHuuw:+;|LU_dKJ%J qldTlDq?!FiWlG*:5>+8x7XAS;9K=9A1K>(f' );
define( 'SECURE_AUTH_SALT',  'ib1[4?!QGL14;Ac;5Yr$L#m+p@2,$btj1Z**Ry4RhC~3!`l%-JUM]`h4 y6V)^5g' );
define( 'LOGGED_IN_SALT',    'WqhBCTW$6UL pvN1Y^4$0zJ2e(@}M*IfObohZ@E*1%.`bWN9#!<L~QMIKdn/!&~C' );
define( 'NONCE_SALT',        'zt+,LegC9%]/mv8ieRP`/3?k=v3P5Hb!;]W6VO(LL${0$-1TGSGwLa)7Zvudk$-p' );
define( 'WP_CACHE_KEY_SALT', '{`J#>?~uh]ZM=vKVTu}GnMg[7<?l?Ev!k ggrj.MV4xgVQugd4YLP`36Y//C a%h' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



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
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
