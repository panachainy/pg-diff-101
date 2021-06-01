/***********************************************/
/*** SCRIPT AUTHOR: panachainy               ***/
/***    CREATED ON: 2021-06-01T07:26:02.197Z ***/
/***********************************************/

--- BEGIN CREATE TABLE "public"."directus_collections" ---

CREATE TABLE IF NOT EXISTS "public"."directus_collections" (
	"collection" varchar(64) NOT NULL  ,
	"icon" varchar(30) NULL  ,
	"note" text NULL  ,
	"display_template" varchar(255) NULL  ,
	"hidden" bool NOT NULL DEFAULT false ,
	"singleton" bool NOT NULL DEFAULT false ,
	"translations" json NULL  ,
	"archive_field" varchar(64) NULL  ,
	"archive_app_filter" bool NOT NULL DEFAULT true ,
	"archive_value" varchar(255) NULL  ,
	"unarchive_value" varchar(255) NULL  ,
	"sort_field" varchar(64) NULL  ,
	"accountability" varchar(255) NULL DEFAULT 'all'::character varying ,
	CONSTRAINT "directus_collections_pkey" PRIMARY KEY (collection) 
);

ALTER TABLE IF EXISTS "public"."directus_collections" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_collections" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_collections" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_collections" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_collections" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_collections" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_collections" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_collections" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_collections" ---

--- BEGIN CREATE TABLE "public"."directus_roles" ---

CREATE TABLE IF NOT EXISTS "public"."directus_roles" (
	"id" uuid NOT NULL  ,
	"name" varchar(100) NOT NULL  ,
	"icon" varchar(30) NOT NULL DEFAULT 'supervised_user_circle'::character varying ,
	"description" text NULL  ,
	"ip_access" text NULL  ,
	"enforce_tfa" bool NOT NULL DEFAULT false ,
	"module_list" json NULL  ,
	"collection_list" json NULL  ,
	"admin_access" bool NOT NULL DEFAULT false ,
	"app_access" bool NOT NULL DEFAULT true ,
	CONSTRAINT "directus_roles_pkey" PRIMARY KEY (id) 
);

ALTER TABLE IF EXISTS "public"."directus_roles" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_roles" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_roles" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_roles" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_roles" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_roles" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_roles" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_roles" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_roles" ---

--- BEGIN CREATE TABLE "public"."directus_users" ---

CREATE TABLE IF NOT EXISTS "public"."directus_users" (
	"id" uuid NOT NULL  ,
	"first_name" varchar(50) NULL  ,
	"last_name" varchar(50) NULL  ,
	"email" varchar(128) NOT NULL  ,
	"password" varchar(255) NULL  ,
	"location" varchar(255) NULL  ,
	"title" varchar(50) NULL  ,
	"description" text NULL  ,
	"tags" json NULL  ,
	"avatar" uuid NULL  ,
	"language" varchar(8) NULL DEFAULT 'en-US'::character varying ,
	"theme" varchar(20) NULL DEFAULT 'auto'::character varying ,
	"tfa_secret" varchar(255) NULL  ,
	"status" varchar(16) NOT NULL DEFAULT 'active'::character varying ,
	"role" uuid NULL  ,
	"token" varchar(255) NULL  ,
	"last_access" timestamptz NULL  ,
	"last_page" varchar(255) NULL  ,
	CONSTRAINT "directus_users_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "directus_users_email_unique" UNIQUE (email) ,
	CONSTRAINT "directus_users_role_foreign" FOREIGN KEY (role) REFERENCES directus_roles(id) 
);

CREATE UNIQUE INDEX IF NOT EXISTS directus_users_email_unique ON public.directus_users USING btree (email);

ALTER TABLE IF EXISTS "public"."directus_users" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_users" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_users" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_users" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_users" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_users" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_users" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_users" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_users" ---

--- BEGIN CREATE TABLE "public"."directus_fields" ---

CREATE TABLE IF NOT EXISTS "public"."directus_fields" (
	"id" serial NOT NULL  ,
	"collection" varchar(64) NOT NULL  ,
	"field" varchar(64) NOT NULL  ,
	"special" varchar(64) NULL  ,
	"interface" varchar(64) NULL  ,
	"options" json NULL  ,
	"display" varchar(64) NULL  ,
	"display_options" json NULL  ,
	"readonly" bool NOT NULL DEFAULT false ,
	"hidden" bool NOT NULL DEFAULT false ,
	"sort" int4 NULL  ,
	"width" varchar(30) NULL DEFAULT 'full'::character varying ,
	"group" int4 NULL  ,
	"translations" json NULL  ,
	"note" text NULL  ,
	CONSTRAINT "directus_fields_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "directus_fields_group_foreign" FOREIGN KEY ("group") REFERENCES directus_fields(id) 
);

ALTER TABLE IF EXISTS "public"."directus_fields" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_fields" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_fields" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_fields" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_fields" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_fields" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_fields" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_fields" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_fields" ---

--- BEGIN CREATE TABLE "public"."directus_permissions" ---

CREATE TABLE IF NOT EXISTS "public"."directus_permissions" (
	"id" serial NOT NULL  ,
	"role" uuid NULL  ,
	"collection" varchar(64) NOT NULL  ,
	"action" varchar(10) NOT NULL  ,
	"permissions" json NULL  ,
	"validation" json NULL  ,
	"presets" json NULL  ,
	"fields" text NULL  ,
	"limit" int4 NULL  ,
	CONSTRAINT "directus_permissions_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "directus_permissions_role_foreign" FOREIGN KEY (role) REFERENCES directus_roles(id) 
);

ALTER TABLE IF EXISTS "public"."directus_permissions" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_permissions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_permissions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_permissions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_permissions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_permissions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_permissions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_permissions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_permissions" ---

--- BEGIN CREATE TABLE "public"."directus_activity" ---

CREATE TABLE IF NOT EXISTS "public"."directus_activity" (
	"id" serial NOT NULL  ,
	"action" varchar(45) NOT NULL  ,
	"user" uuid NULL  ,
	"timestamp" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	"ip" varchar(50) NOT NULL  ,
	"user_agent" varchar(255) NULL  ,
	"collection" varchar(64) NOT NULL  ,
	"item" varchar(255) NOT NULL  ,
	"comment" text NULL  ,
	CONSTRAINT "directus_activity_pkey" PRIMARY KEY (id) 
);

ALTER TABLE IF EXISTS "public"."directus_activity" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_activity" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_activity" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_activity" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_activity" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_activity" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_activity" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_activity" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_activity" ---

--- BEGIN CREATE TABLE "public"."directus_folders" ---

CREATE TABLE IF NOT EXISTS "public"."directus_folders" (
	"id" uuid NOT NULL  ,
	"name" varchar(255) NOT NULL  ,
	"parent" uuid NULL  ,
	CONSTRAINT "directus_folders_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "directus_folders_parent_foreign" FOREIGN KEY (parent) REFERENCES directus_folders(id) 
);

ALTER TABLE IF EXISTS "public"."directus_folders" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_folders" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_folders" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_folders" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_folders" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_folders" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_folders" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_folders" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_folders" ---

--- BEGIN CREATE TABLE "public"."directus_files" ---

CREATE TABLE IF NOT EXISTS "public"."directus_files" (
	"id" uuid NOT NULL  ,
	"storage" varchar(255) NOT NULL  ,
	"filename_disk" varchar(255) NULL  ,
	"filename_download" varchar(255) NOT NULL  ,
	"title" varchar(255) NULL  ,
	"type" varchar(255) NULL  ,
	"folder" uuid NULL  ,
	"uploaded_by" uuid NULL  ,
	"uploaded_on" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	"modified_by" uuid NULL  ,
	"modified_on" timestamptz NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	"charset" varchar(50) NULL  ,
	"filesize" int4 NULL  ,
	"width" int4 NULL  ,
	"height" int4 NULL  ,
	"duration" int4 NULL  ,
	"embed" varchar(200) NULL  ,
	"description" text NULL  ,
	"location" text NULL  ,
	"tags" text NULL  ,
	"metadata" json NULL  ,
	CONSTRAINT "directus_files_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "directus_files_folder_foreign" FOREIGN KEY (folder) REFERENCES directus_folders(id) ,
	CONSTRAINT "directus_files_uploaded_by_foreign" FOREIGN KEY (uploaded_by) REFERENCES directus_users(id) ,
	CONSTRAINT "directus_files_modified_by_foreign" FOREIGN KEY (modified_by) REFERENCES directus_users(id) 
);

ALTER TABLE IF EXISTS "public"."directus_files" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_files" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_files" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_files" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_files" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_files" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_files" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_files" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_files" ---

--- BEGIN CREATE TABLE "public"."directus_presets" ---

CREATE TABLE IF NOT EXISTS "public"."directus_presets" (
	"id" serial NOT NULL  ,
	"bookmark" varchar(255) NULL  ,
	"user" uuid NULL  ,
	"role" uuid NULL  ,
	"collection" varchar(64) NULL  ,
	"search" varchar(100) NULL  ,
	"filters" json NULL  ,
	"layout" varchar(100) NULL DEFAULT 'tabular'::character varying ,
	"layout_query" json NULL  ,
	"layout_options" json NULL  ,
	"refresh_interval" int4 NULL  ,
	CONSTRAINT "directus_presets_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "directus_presets_user_foreign" FOREIGN KEY ("user") REFERENCES directus_users(id) ,
	CONSTRAINT "directus_presets_role_foreign" FOREIGN KEY (role) REFERENCES directus_roles(id) 
);

ALTER TABLE IF EXISTS "public"."directus_presets" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_presets" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_presets" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_presets" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_presets" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_presets" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_presets" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_presets" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_presets" ---

--- BEGIN CREATE TABLE "public"."directus_revisions" ---

CREATE TABLE IF NOT EXISTS "public"."directus_revisions" (
	"id" serial NOT NULL  ,
	"activity" int4 NOT NULL  ,
	"collection" varchar(64) NOT NULL  ,
	"item" varchar(255) NOT NULL  ,
	"data" json NULL  ,
	"delta" json NULL  ,
	"parent" int4 NULL  ,
	CONSTRAINT "directus_revisions_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "directus_revisions_activity_foreign" FOREIGN KEY (activity) REFERENCES directus_activity(id) ,
	CONSTRAINT "directus_revisions_parent_foreign" FOREIGN KEY (parent) REFERENCES directus_revisions(id) 
);

ALTER TABLE IF EXISTS "public"."directus_revisions" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_revisions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_revisions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_revisions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_revisions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_revisions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_revisions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_revisions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_revisions" ---

--- BEGIN CREATE TABLE "public"."directus_relations" ---

CREATE TABLE IF NOT EXISTS "public"."directus_relations" (
	"id" serial NOT NULL  ,
	"many_collection" varchar(64) NOT NULL  ,
	"many_field" varchar(64) NOT NULL  ,
	"many_primary" varchar(64) NOT NULL  ,
	"one_collection" varchar(64) NULL  ,
	"one_field" varchar(64) NULL  ,
	"one_primary" varchar(64) NULL  ,
	"one_collection_field" varchar(64) NULL  ,
	"one_allowed_collections" text NULL  ,
	"junction_field" varchar(64) NULL  ,
	"sort_field" varchar(255) NULL  ,
	CONSTRAINT "directus_relations_pkey" PRIMARY KEY (id) 
);

ALTER TABLE IF EXISTS "public"."directus_relations" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_relations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_relations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_relations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_relations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_relations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_relations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_relations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_relations" ---

--- BEGIN CREATE TABLE "public"."directus_sessions" ---

CREATE TABLE IF NOT EXISTS "public"."directus_sessions" (
	"token" varchar(64) NOT NULL  ,
	"user" uuid NOT NULL  ,
	"expires" timestamptz NOT NULL  ,
	"ip" varchar(255) NULL  ,
	"user_agent" varchar(255) NULL  ,
	CONSTRAINT "directus_sessions_pkey" PRIMARY KEY (token) ,
	CONSTRAINT "directus_sessions_user_foreign" FOREIGN KEY ("user") REFERENCES directus_users(id) 
);

ALTER TABLE IF EXISTS "public"."directus_sessions" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_sessions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_sessions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_sessions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_sessions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_sessions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_sessions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_sessions" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_sessions" ---

--- BEGIN CREATE TABLE "public"."directus_settings" ---

CREATE TABLE IF NOT EXISTS "public"."directus_settings" (
	"id" serial NOT NULL  ,
	"project_name" varchar(100) NOT NULL DEFAULT 'Directus'::character varying ,
	"project_url" varchar(255) NULL  ,
	"project_color" varchar(10) NULL DEFAULT '#00C897'::character varying ,
	"project_logo" uuid NULL  ,
	"public_foreground" uuid NULL  ,
	"public_background" uuid NULL  ,
	"public_note" text NULL  ,
	"auth_login_attempts" int4 NULL DEFAULT 25 ,
	"auth_password_policy" varchar(100) NULL  ,
	"storage_asset_transform" varchar(7) NULL DEFAULT 'all'::character varying ,
	"storage_asset_presets" json NULL  ,
	"custom_css" text NULL  ,
	CONSTRAINT "directus_settings_pkey" PRIMARY KEY (id) ,
	CONSTRAINT "directus_settings_project_logo_foreign" FOREIGN KEY (project_logo) REFERENCES directus_files(id) ,
	CONSTRAINT "directus_settings_public_foreground_foreign" FOREIGN KEY (public_foreground) REFERENCES directus_files(id) ,
	CONSTRAINT "directus_settings_public_background_foreign" FOREIGN KEY (public_background) REFERENCES directus_files(id) 
);

ALTER TABLE IF EXISTS "public"."directus_settings" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_settings" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_settings" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_settings" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_settings" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_settings" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_settings" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_settings" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_settings" ---

--- BEGIN CREATE TABLE "public"."directus_webhooks" ---

CREATE TABLE IF NOT EXISTS "public"."directus_webhooks" (
	"id" serial NOT NULL  ,
	"name" varchar(255) NOT NULL  ,
	"method" varchar(10) NOT NULL DEFAULT 'POST'::character varying ,
	"url" text NULL  ,
	"status" varchar(10) NOT NULL DEFAULT 'active'::character varying ,
	"data" bool NOT NULL DEFAULT true ,
	"actions" varchar(100) NOT NULL  ,
	"collections" text NULL  ,
	CONSTRAINT "directus_webhooks_pkey" PRIMARY KEY (id) 
);

ALTER TABLE IF EXISTS "public"."directus_webhooks" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_webhooks" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_webhooks" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_webhooks" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_webhooks" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_webhooks" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_webhooks" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_webhooks" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_webhooks" ---

--- BEGIN CREATE TABLE "public"."directus_migrations" ---

CREATE TABLE IF NOT EXISTS "public"."directus_migrations" (
	"version" varchar(255) NOT NULL  ,
	"name" varchar(255) NOT NULL  ,
	"timestamp" timestamptz NULL DEFAULT CURRENT_TIMESTAMP ,
	CONSTRAINT "directus_migrations_pkey" PRIMARY KEY (version) 
);

ALTER TABLE IF EXISTS "public"."directus_migrations" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."directus_migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."directus_migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."directus_migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."directus_migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."directus_migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."directus_migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."directus_migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."directus_migrations" ---

--- BEGIN CREATE TABLE "public"."languages" ---

CREATE TABLE IF NOT EXISTS "public"."languages" (
	"code" varchar(255) NOT NULL  ,
	"name" varchar(255) NULL  ,
	CONSTRAINT "languages_pkey" PRIMARY KEY (code) 
);

ALTER TABLE IF EXISTS "public"."languages" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."languages" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."languages" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."languages" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."languages" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."languages" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."languages" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."languages" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."languages" ---

--- BEGIN CREATE TABLE "public"."product_translations" ---

CREATE TABLE IF NOT EXISTS "public"."product_translations" (
	"id" serial NOT NULL  ,
	"product_id" int4 NULL  ,
	"languages_code" varchar(255) NULL  ,
	"name" varchar(255) NULL  ,
	"last_name" varchar(255) NULL  ,
	CONSTRAINT "product_translations_pkey" PRIMARY KEY (id) 
);

ALTER TABLE IF EXISTS "public"."product_translations" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."product_translations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."product_translations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."product_translations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."product_translations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."product_translations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."product_translations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."product_translations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."product_translations" ---

--- BEGIN CREATE TABLE "public"."migrations" ---

CREATE TABLE IF NOT EXISTS "public"."migrations" (
	"version" varchar(17) NOT NULL  ,
	"name" varchar NOT NULL  ,
	"status" varchar(5) NOT NULL DEFAULT ''::character varying ,
	"last_message" varchar NULL  ,
	"script" varchar NOT NULL DEFAULT ''::character varying ,
	"applied_on" timestamp NULL  ,
	CONSTRAINT "migrations_pkey" PRIMARY KEY (version) 
);

ALTER TABLE IF EXISTS "public"."migrations" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."migrations" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."migrations" ---

--- BEGIN CREATE TABLE "public"."product" ---

CREATE TABLE IF NOT EXISTS "public"."product" (
	"id" serial NOT NULL  ,
	"description" varchar(255) NULL  ,
	"detail" varchar(255) NULL  ,
	CONSTRAINT "product_pkey" PRIMARY KEY (id) 
);

ALTER TABLE IF EXISTS "public"."product" OWNER TO postgres;

GRANT SELECT ON TABLE "public"."product" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT INSERT ON TABLE "public"."product" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON TABLE "public"."product" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT DELETE ON TABLE "public"."product" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRUNCATE ON TABLE "public"."product" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT REFERENCES ON TABLE "public"."product" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT TRIGGER ON TABLE "public"."product" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE TABLE "public"."product" ---

--- BEGIN CREATE SEQUENCE "public"."directus_fields_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."directus_fields_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."directus_fields_id_seq" OWNER TO postgres;
GRANT SELECT ON SEQUENCE "public"."directus_fields_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."directus_fields_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."directus_fields_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE SEQUENCE "public"."directus_fields_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."directus_activity_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."directus_activity_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."directus_activity_id_seq" OWNER TO postgres;
GRANT SELECT ON SEQUENCE "public"."directus_activity_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."directus_activity_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."directus_activity_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE SEQUENCE "public"."directus_activity_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."directus_permissions_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."directus_permissions_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."directus_permissions_id_seq" OWNER TO postgres;
GRANT SELECT ON SEQUENCE "public"."directus_permissions_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."directus_permissions_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."directus_permissions_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE SEQUENCE "public"."directus_permissions_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."directus_presets_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."directus_presets_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."directus_presets_id_seq" OWNER TO postgres;
GRANT SELECT ON SEQUENCE "public"."directus_presets_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."directus_presets_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."directus_presets_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE SEQUENCE "public"."directus_presets_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."directus_relations_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."directus_relations_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."directus_relations_id_seq" OWNER TO postgres;
GRANT SELECT ON SEQUENCE "public"."directus_relations_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."directus_relations_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."directus_relations_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE SEQUENCE "public"."directus_relations_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."directus_revisions_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."directus_revisions_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."directus_revisions_id_seq" OWNER TO postgres;
GRANT SELECT ON SEQUENCE "public"."directus_revisions_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."directus_revisions_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."directus_revisions_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE SEQUENCE "public"."directus_revisions_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."directus_settings_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."directus_settings_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."directus_settings_id_seq" OWNER TO postgres;
GRANT SELECT ON SEQUENCE "public"."directus_settings_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."directus_settings_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."directus_settings_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE SEQUENCE "public"."directus_settings_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."directus_webhooks_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."directus_webhooks_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."directus_webhooks_id_seq" OWNER TO postgres;
GRANT SELECT ON SEQUENCE "public"."directus_webhooks_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."directus_webhooks_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."directus_webhooks_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE SEQUENCE "public"."directus_webhooks_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."product_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."product_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."product_id_seq" OWNER TO postgres;
GRANT SELECT ON SEQUENCE "public"."product_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."product_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."product_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE SEQUENCE "public"."product_id_seq" ---

--- BEGIN CREATE SEQUENCE "public"."product_translations_id_seq" ---


CREATE SEQUENCE IF NOT EXISTS "public"."product_translations_id_seq" 
	INCREMENT BY 1 
	MINVALUE 1
	MAXVALUE 2147483647
	START WITH 1
	CACHE 1
	NO CYCLE;

ALTER SEQUENCE "public"."product_translations_id_seq" OWNER TO postgres;
GRANT SELECT ON SEQUENCE "public"."product_translations_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT USAGE ON SEQUENCE "public"."product_translations_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!
GRANT UPDATE ON SEQUENCE "public"."product_translations_id_seq" TO postgres; --WARN: Grant\Revoke privileges to a role can occure in a sql error during execution if role is missing to the target database!

--- END CREATE SEQUENCE "public"."product_translations_id_seq" ---
