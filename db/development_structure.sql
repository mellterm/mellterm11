CREATE TABLE "domains" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar(255), "long_name" varchar(255), "image" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "languages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar(255), "long_name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "terms" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "source_content" varchar(255), "target_content" varchar(255), "source_language_id" integer, "target_language_id" integer, "domain_id" integer, "notes" text, "source" integer, "is_query" boolean, "is_public" boolean, "created_at" datetime, "updated_at" datetime, "user_id" integer);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "email" varchar(255), "phone" varchar(255), "skype" varchar(255), "time_zone" varchar(255), "notes" text, "rate" integer, "created_at" datetime, "updated_at" datetime, "encrypted_password" varchar(255), "salt" varchar(255), "admin" boolean DEFAULT 'f');
CREATE INDEX "index_terms_on_domain_id" ON "terms" ("domain_id");
CREATE INDEX "index_terms_on_source_language_id" ON "terms" ("source_language_id");
CREATE INDEX "index_terms_on_target_language_id" ON "terms" ("target_language_id");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110115003458');

INSERT INTO schema_migrations (version) VALUES ('20110103082404');

INSERT INTO schema_migrations (version) VALUES ('20110103125220');

INSERT INTO schema_migrations (version) VALUES ('20110103175526');

INSERT INTO schema_migrations (version) VALUES ('20110104084431');

INSERT INTO schema_migrations (version) VALUES ('20110109083719');

INSERT INTO schema_migrations (version) VALUES ('20110114235005');

INSERT INTO schema_migrations (version) VALUES ('20110115001010');

INSERT INTO schema_migrations (version) VALUES ('20110115001421');

INSERT INTO schema_migrations (version) VALUES ('20110115002018');