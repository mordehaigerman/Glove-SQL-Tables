/*
 * Glove SQL Tables
 *
 * Copyright (c) 2010-2013 Mordehai German (http://mordehaigerman.com)
 *
 * This source file is subject to the New BSD License that is bundled
 * with this package in the file LICENSE.txt. It is also available at
 * http://www.opensource.org/licenses/bsd-license.php
 *
 * GitHub:  https://github.com/mordehaigerman/Glove-SQL-Tables
 * Version: 1.0.0
 * Package: PostgreSQL
 */

/*
 * Users Table
 */
create table users (
	`user_id`	serial			not null,

	`username`	varchar(255)	not null,
	`password`	varchar(255)	not null,

	`role`		varchar(255)	not null,
	`status`	varchar(255)	not null,
	`date`		timestamptz		not null,

	primary key (`user_id`),
	unique (`username`)
);

/*
 * Users Data Table
 */
create table `users_data` (
	`user_id`	int				not null,
	`name`		varchar(255)	not null,
	`content`	text			not null,

	primary key (`user_id`, `name`),
	foreign key (`user_id`) references `users` (`user_id`)
);

/*
 * Posts Table
 */
create table `posts` (
	`post_id`	serial			not null,
	`user_id`	int				not null,

	`url`		varchar(255)	not null,
	`status`	varchar(255)	not null,
	`date`		timestamptz		not null,

	primary key (`post_id`),
	foreign key (`user_id`) references `users` (`user_id`)
);

/*
 * Posts URL Index
 */
create index `posts_url` on `posts` (`url`);

/*
 * Posts Data Table
 */
create table `posts_data` (
	`post_id`	int				not null,
	`name`		varchar(255)	not null,
	`content`	text			not null,

	primary key (`post_id`, `name`),
	foreign key (`post_id`) references `posts` (`post_id`)
);

/*
 * Posts Tags Table
 */
create table `posts_tags` (
	`post_id`	int				not null,
	`tag`		varchar(255)	not null,

	primary key (`post_id`, `tag`),
	foreign key (`post_id`) references `posts` (`post_id`)
);

/*
 * Pages Table
 */
create table `pages` (
	`page_id`	serial			not null,
	`user_id`	int				not null,

	`parent_id`	int					null,
	`namespace`	varchar(255)	not null,

	`url`		varchar(255)	not null,
	`status`	varchar(255)	not null,
	`date`		timestamptz		not null,

	primary key (`page_id`),
	foreign key (`user_id`) references `users` (`user_id`)
);

/*
 * Pages URL Index
 */
create index `pages_url` on `pages` (`url`);

/*
 * Pages Data Table
 */
create table `pages_data` (
	`page_id`	int				not null,
	`name`		varchar(255)	not null,
	`content`	text			not null,

	primary key (`page_id`, `name`),
	foreign key (`page_id`) references `pages` (`page_id`)
);
