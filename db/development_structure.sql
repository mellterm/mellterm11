CREATE TABLE "associations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "translation_id" integer, "description" varchar(255), "associable_id" integer, "associable_type" varchar(255));
CREATE TABLE "companies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar(255), "long_name" varchar(255), "notes" text, "address" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "currencies" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "long_name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "documents" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "document_type" varchar(255), "user_id" integer, "provider_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "domain_cubes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "translation_id" integer, "domain_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "domains" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar(255), "long_name" varchar(255), "image" varchar(255), "created_at" datetime, "updated_at" datetime, "photo_file_name" varchar(255), "photo_content_type" varchar(255), "photo_file_size" integer, "photo_updated_at" datetime);
CREATE TABLE "languages" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "code" varchar(255), "long_name" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "providers" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "provider_name" varchar(255), "description" varchar(255), "source_language_id" integer, "target_language_id" integer, "default_domain_id" integer, "default_is_public" boolean, "default_source_id" integer, "user_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "searches" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "source_content" varchar(255), "target_content" varchar(255), "source_language_id" integer, "target_language_id" integer, "domain_id" integer, "is_public" boolean, "is_query" boolean, "created_at" datetime, "updated_at" datetime, "user_id" integer, "job_id" integer);
CREATE TABLE "source_tus" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" varchar(255), "language_id" integer, "definition" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "sources" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "description" varchar(255), "is_public" boolean, "url" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "subscriptions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "subscriber_id" integer, "subscribee_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "target_tus" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "content" varchar(255), "language_id" integer, "definition" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "translations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "source_tu_id" integer, "target_tu_id" integer, "is_public" boolean DEFAULT 'f', "provider_id" integer, "company_id" integer, "source_id" integer, "source_url" varchar(255), "document_id" integer, "user_id" integer, "translation_type" varchar(255), "created_at" datetime, "updated_at" datetime);
CREATE TABLE "users" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "email" varchar(255), "phone" varchar(255), "skype" varchar(255), "time_zone" varchar(255), "notes" text, "created_at" datetime, "updated_at" datetime, "encrypted_password" varchar(255), "salt" varchar(255), "admin" boolean DEFAULT 'f', "city_name" varchar(255), "native_language_id" integer, "preferred_language_id" integer, "provider_id" integer, "credit_balance" integer DEFAULT 0);
CREATE INDEX "index_documents_on_provider_id" ON "documents" ("provider_id");
CREATE UNIQUE INDEX "index_domain_cubes_on_translation_id_and_domain_id" ON "domain_cubes" ("translation_id", "domain_id");
CREATE INDEX "index_providers_on_user_id" ON "providers" ("user_id");
CREATE INDEX "index_source_tus_on_content" ON "source_tus" ("content");
CREATE INDEX "index_subscriptions_on_subscribee_id" ON "subscriptions" ("subscribee_id");
CREATE INDEX "index_subscriptions_on_subscriber_id" ON "subscriptions" ("subscriber_id");
CREATE UNIQUE INDEX "index_subscriptions_on_subscriber_id_and_subscribee_id" ON "subscriptions" ("subscriber_id", "subscribee_id");
CREATE INDEX "index_target_tus_on_content" ON "target_tus" ("content");
CREATE INDEX "index_translations_on_user_id" ON "translations" ("user_id");
CREATE UNIQUE INDEX "index_users_on_email" ON "users" ("email");
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110403043729');

INSERT INTO schema_migrations (version) VALUES ('20110103082404');

INSERT INTO schema_migrations (version) VALUES ('20110103125220');

INSERT INTO schema_migrations (version) VALUES ('20110103175526');

INSERT INTO schema_migrations (version) VALUES ('20110104084431');

INSERT INTO schema_migrations (version) VALUES ('20110109083719');

INSERT INTO schema_migrations (version) VALUES ('20110115001010');

INSERT INTO schema_migrations (version) VALUES ('20110115001421');

INSERT INTO schema_migrations (version) VALUES ('20110121082437');

INSERT INTO schema_migrations (version) VALUES ('20110125162515');

INSERT INTO schema_migrations (version) VALUES ('20110126110437');

INSERT INTO schema_migrations (version) VALUES ('20110201003802');

INSERT INTO schema_migrations (version) VALUES ('20110201004957');

INSERT INTO schema_migrations (version) VALUES ('20110201031241');

INSERT INTO schema_migrations (version) VALUES ('20110201035501');

INSERT INTO schema_migrations (version) VALUES ('20110306164311');

INSERT INTO schema_migrations (version) VALUES ('20110306164706');

INSERT INTO schema_migrations (version) VALUES ('20110306180438');

INSERT INTO schema_migrations (version) VALUES ('20110403043232');

INSERT INTO schema_migrations (version) VALUES ('20110219055528');

INSERT INTO schema_migrations (version) VALUES ('20110424085357');