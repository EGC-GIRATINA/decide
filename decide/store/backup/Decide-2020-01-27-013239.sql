--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.voting_voting DROP CONSTRAINT voting_voting_question_id_9e97fbf8_fk_voting_question_id;
ALTER TABLE ONLY public.voting_voting DROP CONSTRAINT voting_voting_pub_key_id_1ae022f2_fk_base_key_id;
ALTER TABLE ONLY public.voting_voting_auths DROP CONSTRAINT voting_voting_auths_voting_id_7d549c6f_fk_voting_voting_id;
ALTER TABLE ONLY public.voting_voting_auths DROP CONSTRAINT voting_voting_auths_auth_id_ca0d0b4c_fk_base_auth_id;
ALTER TABLE ONLY public.voting_questionoption DROP CONSTRAINT voting_questionoptio_question_id_19a4bcc8_fk_voting_qu;
ALTER TABLE ONLY public.mixnet_mixnet DROP CONSTRAINT mixnet_mixnet_pubkey_id_bd539c04_fk_base_key_id;
ALTER TABLE ONLY public.mixnet_mixnet DROP CONSTRAINT mixnet_mixnet_key_id_9e26aa36_fk_base_key_id;
ALTER TABLE ONLY public.mixnet_mixnet_auths DROP CONSTRAINT mixnet_mixnet_auths_mixnet_id_17d16753_fk_mixnet_mixnet_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE ONLY public.background_task DROP CONSTRAINT background_task_creator_content_type_61cc9af3_fk_django_co;
ALTER TABLE ONLY public.background_task_completedtask DROP CONSTRAINT background_task_comp_creator_content_type_21d6a741_fk_django_co;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
DROP INDEX public.voting_voting_question_id_9e97fbf8;
DROP INDEX public.voting_voting_auths_voting_id_7d549c6f;
DROP INDEX public.voting_voting_auths_auth_id_ca0d0b4c;
DROP INDEX public.voting_questionoption_question_id_19a4bcc8;
DROP INDEX public.mixnet_mixnet_pubkey_id_bd539c04;
DROP INDEX public.mixnet_mixnet_key_id_9e26aa36;
DROP INDEX public.mixnet_mixnet_auths_mixnet_id_17d16753;
DROP INDEX public.mixnet_mixnet_auths_auth_id_247a47a8;
DROP INDEX public.django_session_session_key_c0390e0f_like;
DROP INDEX public.django_session_expire_date_a5c62663;
DROP INDEX public.django_cron_cronjoblog_start_time_d68c0dd9;
DROP INDEX public.django_cron_cronjoblog_ran_at_time_7fed2751;
DROP INDEX public.django_cron_cronjoblog_end_time_7918602a;
DROP INDEX public.django_cron_cronjoblog_code_start_time_ran_at_time_8b50b8fa_idx;
DROP INDEX public.django_cron_cronjoblog_code_start_time_4fc78f9d_idx;
DROP INDEX public.django_cron_cronjoblog_code_is_success_ran_at_time_84da9606_idx;
DROP INDEX public.django_cron_cronjoblog_code_48865653_like;
DROP INDEX public.django_cron_cronjoblog_code_48865653;
DROP INDEX public.django_admin_log_user_id_c564eba6;
DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX public.background_task_task_name_4562d56a_like;
DROP INDEX public.background_task_task_name_4562d56a;
DROP INDEX public.background_task_task_hash_d8f233bd_like;
DROP INDEX public.background_task_task_hash_d8f233bd;
DROP INDEX public.background_task_run_at_7baca3aa;
DROP INDEX public.background_task_queue_1d5f3a40_like;
DROP INDEX public.background_task_queue_1d5f3a40;
DROP INDEX public.background_task_priority_88bdbce9;
DROP INDEX public.background_task_locked_by_db7779e3_like;
DROP INDEX public.background_task_locked_by_db7779e3;
DROP INDEX public.background_task_locked_at_0fb0f225;
DROP INDEX public.background_task_failed_at_b81bba14;
DROP INDEX public.background_task_creator_content_type_id_61cc9af3;
DROP INDEX public.background_task_completedtask_task_name_388dabc2_like;
DROP INDEX public.background_task_completedtask_task_name_388dabc2;
DROP INDEX public.background_task_completedtask_task_hash_91187576_like;
DROP INDEX public.background_task_completedtask_task_hash_91187576;
DROP INDEX public.background_task_completedtask_run_at_77c80f34;
DROP INDEX public.background_task_completedtask_queue_61fb0415_like;
DROP INDEX public.background_task_completedtask_queue_61fb0415;
DROP INDEX public.background_task_completedtask_priority_9080692e;
DROP INDEX public.background_task_completedtask_locked_by_edc8a213_like;
DROP INDEX public.background_task_completedtask_locked_by_edc8a213;
DROP INDEX public.background_task_completedtask_locked_at_29c62708;
DROP INDEX public.background_task_completedtask_failed_at_3de56618;
DROP INDEX public.background_task_completedtask_creator_content_type_id_21d6a741;
DROP INDEX public.background_task_completedtask_attempts_772a6783;
DROP INDEX public.background_task_attempts_a9ade23d;
DROP INDEX public.authtoken_token_key_10f0b77e_like;
DROP INDEX public.auth_user_username_6821ab7c_like;
DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
DROP INDEX public.auth_user_groups_group_id_97559544;
DROP INDEX public.auth_permission_content_type_id_2f476e4b;
DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX public.auth_group_name_a6ea08ec_like;
ALTER TABLE ONLY public.voting_voting DROP CONSTRAINT voting_voting_pub_key_id_key;
ALTER TABLE ONLY public.voting_voting DROP CONSTRAINT voting_voting_pkey;
ALTER TABLE ONLY public.voting_voting_auths DROP CONSTRAINT voting_voting_auths_voting_id_auth_id_73b2c117_uniq;
ALTER TABLE ONLY public.voting_voting_auths DROP CONSTRAINT voting_voting_auths_pkey;
ALTER TABLE ONLY public.voting_questionoption DROP CONSTRAINT voting_questionoption_pkey;
ALTER TABLE ONLY public.voting_question DROP CONSTRAINT voting_question_pkey;
ALTER TABLE ONLY public.store_vote DROP CONSTRAINT store_vote_pkey;
ALTER TABLE ONLY public.store_backup DROP CONSTRAINT store_backup_pkey;
ALTER TABLE ONLY public.mixnet_mixnet DROP CONSTRAINT mixnet_mixnet_pkey;
ALTER TABLE ONLY public.mixnet_mixnet_auths DROP CONSTRAINT mixnet_mixnet_auths_pkey;
ALTER TABLE ONLY public.mixnet_mixnet_auths DROP CONSTRAINT mixnet_mixnet_auths_mixnet_id_auth_id_f0748f49_uniq;
ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
ALTER TABLE ONLY public.django_cron_cronjoblog DROP CONSTRAINT django_cron_cronjoblog_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
ALTER TABLE ONLY public.census_census DROP CONSTRAINT census_census_voting_id_voter_id_d06a5c5b_uniq;
ALTER TABLE ONLY public.census_census DROP CONSTRAINT census_census_pkey;
ALTER TABLE ONLY public.base_key DROP CONSTRAINT base_key_pkey;
ALTER TABLE ONLY public.base_auth DROP CONSTRAINT base_auth_pkey;
ALTER TABLE ONLY public.background_task DROP CONSTRAINT background_task_pkey;
ALTER TABLE ONLY public.background_task_completedtask DROP CONSTRAINT background_task_completedtask_pkey;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_user_id_key;
ALTER TABLE ONLY public.authtoken_token DROP CONSTRAINT authtoken_token_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
ALTER TABLE public.voting_voting_auths ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.voting_voting ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.voting_questionoption ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.voting_question ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.store_vote ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.store_backup ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.mixnet_mixnet_auths ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.mixnet_mixnet ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_cron_cronjoblog ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.census_census ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.base_key ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.base_auth ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.background_task_completedtask ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.background_task ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.voting_voting_id_seq;
DROP SEQUENCE public.voting_voting_auths_id_seq;
DROP TABLE public.voting_voting_auths;
DROP TABLE public.voting_voting;
DROP SEQUENCE public.voting_questionoption_id_seq;
DROP TABLE public.voting_questionoption;
DROP SEQUENCE public.voting_question_id_seq;
DROP TABLE public.voting_question;
DROP SEQUENCE public.store_vote_id_seq;
DROP TABLE public.store_vote;
DROP SEQUENCE public.store_backup_id_seq;
DROP TABLE public.store_backup;
DROP SEQUENCE public.mixnet_mixnet_id_seq;
DROP SEQUENCE public.mixnet_mixnet_auths_id_seq;
DROP TABLE public.mixnet_mixnet_auths;
DROP TABLE public.mixnet_mixnet;
DROP TABLE public.django_session;
DROP SEQUENCE public.django_migrations_id_seq;
DROP TABLE public.django_migrations;
DROP SEQUENCE public.django_cron_cronjoblog_id_seq;
DROP TABLE public.django_cron_cronjoblog;
DROP SEQUENCE public.django_content_type_id_seq;
DROP TABLE public.django_content_type;
DROP SEQUENCE public.django_admin_log_id_seq;
DROP TABLE public.django_admin_log;
DROP SEQUENCE public.census_census_id_seq;
DROP TABLE public.census_census;
DROP SEQUENCE public.base_key_id_seq;
DROP TABLE public.base_key;
DROP SEQUENCE public.base_auth_id_seq;
DROP TABLE public.base_auth;
DROP SEQUENCE public.background_task_id_seq;
DROP SEQUENCE public.background_task_completedtask_id_seq;
DROP TABLE public.background_task_completedtask;
DROP TABLE public.background_task;
DROP TABLE public.authtoken_token;
DROP SEQUENCE public.auth_user_user_permissions_id_seq;
DROP TABLE public.auth_user_user_permissions;
DROP SEQUENCE public.auth_user_id_seq;
DROP SEQUENCE public.auth_user_groups_id_seq;
DROP TABLE public.auth_user_groups;
DROP TABLE public.auth_user;
DROP SEQUENCE public.auth_permission_id_seq;
DROP TABLE public.auth_permission;
DROP SEQUENCE public.auth_group_permissions_id_seq;
DROP TABLE public.auth_group_permissions;
DROP SEQUENCE public.auth_group_id_seq;
DROP TABLE public.auth_group;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO decide;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO decide;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO decide;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO decide;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO decide;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO decide;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO decide;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO decide;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO decide;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO decide;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO decide;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO decide;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO decide;

--
-- Name: background_task; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.background_task (
    id integer NOT NULL,
    task_name character varying(190) NOT NULL,
    task_params text NOT NULL,
    task_hash character varying(40) NOT NULL,
    verbose_name character varying(255),
    priority integer NOT NULL,
    run_at timestamp with time zone NOT NULL,
    repeat bigint NOT NULL,
    repeat_until timestamp with time zone,
    queue character varying(190),
    attempts integer NOT NULL,
    failed_at timestamp with time zone,
    last_error text NOT NULL,
    locked_by character varying(64),
    locked_at timestamp with time zone,
    creator_object_id integer,
    creator_content_type_id integer,
    CONSTRAINT background_task_creator_object_id_check CHECK ((creator_object_id >= 0))
);


ALTER TABLE public.background_task OWNER TO decide;

--
-- Name: background_task_completedtask; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.background_task_completedtask (
    id integer NOT NULL,
    task_name character varying(190) NOT NULL,
    task_params text NOT NULL,
    task_hash character varying(40) NOT NULL,
    verbose_name character varying(255),
    priority integer NOT NULL,
    run_at timestamp with time zone NOT NULL,
    repeat bigint NOT NULL,
    repeat_until timestamp with time zone,
    queue character varying(190),
    attempts integer NOT NULL,
    failed_at timestamp with time zone,
    last_error text NOT NULL,
    locked_by character varying(64),
    locked_at timestamp with time zone,
    creator_object_id integer,
    creator_content_type_id integer,
    CONSTRAINT background_task_completedtask_creator_object_id_check CHECK ((creator_object_id >= 0))
);


ALTER TABLE public.background_task_completedtask OWNER TO decide;

--
-- Name: background_task_completedtask_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.background_task_completedtask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.background_task_completedtask_id_seq OWNER TO decide;

--
-- Name: background_task_completedtask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.background_task_completedtask_id_seq OWNED BY public.background_task_completedtask.id;


--
-- Name: background_task_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.background_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.background_task_id_seq OWNER TO decide;

--
-- Name: background_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.background_task_id_seq OWNED BY public.background_task.id;


--
-- Name: base_auth; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.base_auth (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    url character varying(200) NOT NULL,
    me boolean NOT NULL
);


ALTER TABLE public.base_auth OWNER TO decide;

--
-- Name: base_auth_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.base_auth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_auth_id_seq OWNER TO decide;

--
-- Name: base_auth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.base_auth_id_seq OWNED BY public.base_auth.id;


--
-- Name: base_key; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.base_key (
    id integer NOT NULL,
    p text NOT NULL,
    g text NOT NULL,
    y text NOT NULL,
    x text
);


ALTER TABLE public.base_key OWNER TO decide;

--
-- Name: base_key_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.base_key_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_key_id_seq OWNER TO decide;

--
-- Name: base_key_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.base_key_id_seq OWNED BY public.base_key.id;


--
-- Name: census_census; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.census_census (
    id integer NOT NULL,
    voting_id integer NOT NULL,
    voter_id integer NOT NULL,
    CONSTRAINT census_census_voter_id_check CHECK ((voter_id >= 0)),
    CONSTRAINT census_census_voting_id_check CHECK ((voting_id >= 0))
);


ALTER TABLE public.census_census OWNER TO decide;

--
-- Name: census_census_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.census_census_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.census_census_id_seq OWNER TO decide;

--
-- Name: census_census_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.census_census_id_seq OWNED BY public.census_census.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO decide;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO decide;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO decide;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO decide;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_cron_cronjoblog; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.django_cron_cronjoblog (
    id integer NOT NULL,
    code character varying(64) NOT NULL,
    start_time timestamp with time zone NOT NULL,
    end_time timestamp with time zone NOT NULL,
    is_success boolean NOT NULL,
    message text NOT NULL,
    ran_at_time time without time zone
);


ALTER TABLE public.django_cron_cronjoblog OWNER TO decide;

--
-- Name: django_cron_cronjoblog_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.django_cron_cronjoblog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_cron_cronjoblog_id_seq OWNER TO decide;

--
-- Name: django_cron_cronjoblog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.django_cron_cronjoblog_id_seq OWNED BY public.django_cron_cronjoblog.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO decide;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO decide;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO decide;

--
-- Name: mixnet_mixnet; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.mixnet_mixnet (
    id integer NOT NULL,
    voting_id integer NOT NULL,
    key_id integer,
    pubkey_id integer,
    auth_position integer NOT NULL,
    CONSTRAINT mixnet_mixnet_auth_position_check CHECK ((auth_position >= 0)),
    CONSTRAINT mixnet_mixnet_voting_id_4469925a_check CHECK ((voting_id >= 0))
);


ALTER TABLE public.mixnet_mixnet OWNER TO decide;

--
-- Name: mixnet_mixnet_auths; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.mixnet_mixnet_auths (
    id integer NOT NULL,
    mixnet_id integer NOT NULL,
    auth_id integer NOT NULL
);


ALTER TABLE public.mixnet_mixnet_auths OWNER TO decide;

--
-- Name: mixnet_mixnet_auths_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.mixnet_mixnet_auths_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mixnet_mixnet_auths_id_seq OWNER TO decide;

--
-- Name: mixnet_mixnet_auths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.mixnet_mixnet_auths_id_seq OWNED BY public.mixnet_mixnet_auths.id;


--
-- Name: mixnet_mixnet_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.mixnet_mixnet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mixnet_mixnet_id_seq OWNER TO decide;

--
-- Name: mixnet_mixnet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.mixnet_mixnet_id_seq OWNED BY public.mixnet_mixnet.id;


--
-- Name: store_backup; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.store_backup (
    id integer NOT NULL
);


ALTER TABLE public.store_backup OWNER TO decide;

--
-- Name: store_backup_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.store_backup_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_backup_id_seq OWNER TO decide;

--
-- Name: store_backup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.store_backup_id_seq OWNED BY public.store_backup.id;


--
-- Name: store_vote; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.store_vote (
    id integer NOT NULL,
    voting_id integer NOT NULL,
    voter_id integer NOT NULL,
    a text NOT NULL,
    b text NOT NULL,
    voted timestamp with time zone NOT NULL,
    CONSTRAINT store_vote_voter_id_check CHECK ((voter_id >= 0)),
    CONSTRAINT store_vote_voting_id_check CHECK ((voting_id >= 0))
);


ALTER TABLE public.store_vote OWNER TO decide;

--
-- Name: store_vote_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.store_vote_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_vote_id_seq OWNER TO decide;

--
-- Name: store_vote_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.store_vote_id_seq OWNED BY public.store_vote.id;


--
-- Name: voting_question; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.voting_question (
    id integer NOT NULL,
    "desc" text NOT NULL
);


ALTER TABLE public.voting_question OWNER TO decide;

--
-- Name: voting_question_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.voting_question_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voting_question_id_seq OWNER TO decide;

--
-- Name: voting_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.voting_question_id_seq OWNED BY public.voting_question.id;


--
-- Name: voting_questionoption; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.voting_questionoption (
    id integer NOT NULL,
    number integer,
    option text NOT NULL,
    question_id integer NOT NULL,
    CONSTRAINT voting_questionoption_number_check CHECK ((number >= 0))
);


ALTER TABLE public.voting_questionoption OWNER TO decide;

--
-- Name: voting_questionoption_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.voting_questionoption_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voting_questionoption_id_seq OWNER TO decide;

--
-- Name: voting_questionoption_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.voting_questionoption_id_seq OWNED BY public.voting_questionoption.id;


--
-- Name: voting_voting; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.voting_voting (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    "desc" text,
    start_date timestamp with time zone,
    end_date timestamp with time zone,
    pub_key_id integer,
    question_id integer NOT NULL,
    postproc jsonb,
    tally jsonb
);


ALTER TABLE public.voting_voting OWNER TO decide;

--
-- Name: voting_voting_auths; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.voting_voting_auths (
    id integer NOT NULL,
    voting_id integer NOT NULL,
    auth_id integer NOT NULL
);


ALTER TABLE public.voting_voting_auths OWNER TO decide;

--
-- Name: voting_voting_auths_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.voting_voting_auths_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voting_voting_auths_id_seq OWNER TO decide;

--
-- Name: voting_voting_auths_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.voting_voting_auths_id_seq OWNED BY public.voting_voting_auths.id;


--
-- Name: voting_voting_id_seq; Type: SEQUENCE; Schema: public; Owner: decide
--

CREATE SEQUENCE public.voting_voting_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.voting_voting_id_seq OWNER TO decide;

--
-- Name: voting_voting_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: decide
--

ALTER SEQUENCE public.voting_voting_id_seq OWNED BY public.voting_voting.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: background_task id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.background_task ALTER COLUMN id SET DEFAULT nextval('public.background_task_id_seq'::regclass);


--
-- Name: background_task_completedtask id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.background_task_completedtask ALTER COLUMN id SET DEFAULT nextval('public.background_task_completedtask_id_seq'::regclass);


--
-- Name: base_auth id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.base_auth ALTER COLUMN id SET DEFAULT nextval('public.base_auth_id_seq'::regclass);


--
-- Name: base_key id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.base_key ALTER COLUMN id SET DEFAULT nextval('public.base_key_id_seq'::regclass);


--
-- Name: census_census id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.census_census ALTER COLUMN id SET DEFAULT nextval('public.census_census_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_cron_cronjoblog id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_cron_cronjoblog ALTER COLUMN id SET DEFAULT nextval('public.django_cron_cronjoblog_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: mixnet_mixnet id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.mixnet_mixnet ALTER COLUMN id SET DEFAULT nextval('public.mixnet_mixnet_id_seq'::regclass);


--
-- Name: mixnet_mixnet_auths id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.mixnet_mixnet_auths ALTER COLUMN id SET DEFAULT nextval('public.mixnet_mixnet_auths_id_seq'::regclass);


--
-- Name: store_backup id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.store_backup ALTER COLUMN id SET DEFAULT nextval('public.store_backup_id_seq'::regclass);


--
-- Name: store_vote id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.store_vote ALTER COLUMN id SET DEFAULT nextval('public.store_vote_id_seq'::regclass);


--
-- Name: voting_question id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_question ALTER COLUMN id SET DEFAULT nextval('public.voting_question_id_seq'::regclass);


--
-- Name: voting_questionoption id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_questionoption ALTER COLUMN id SET DEFAULT nextval('public.voting_questionoption_id_seq'::regclass);


--
-- Name: voting_voting id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_voting ALTER COLUMN id SET DEFAULT nextval('public.voting_voting_id_seq'::regclass);


--
-- Name: voting_voting_auths id; Type: DEFAULT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_voting_auths ALTER COLUMN id SET DEFAULT nextval('public.voting_voting_auths_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.auth_group (id, name) FROM stdin;
1	Dios
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	1
2	1	2
3	1	3
4	1	4
5	1	5
6	1	6
7	1	7
8	1	8
9	1	9
10	1	10
11	1	11
12	1	12
13	1	13
14	1	14
15	1	15
16	1	16
17	1	17
18	1	18
19	1	19
20	1	20
21	1	21
22	1	22
23	1	23
24	1	24
25	1	25
26	1	26
27	1	27
28	1	28
29	1	29
30	1	30
31	1	31
32	1	32
33	1	33
34	1	34
35	1	35
36	1	36
37	1	37
38	1	38
39	1	39
40	1	40
41	1	41
42	1	42
43	1	43
44	1	44
45	1	45
46	1	46
47	1	47
48	1	48
49	1	49
50	1	50
51	1	51
52	1	52
53	1	53
54	1	54
55	1	55
56	1	56
57	1	57
58	1	58
59	1	59
60	1	60
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Token	7	add_token
26	Can change Token	7	change_token
27	Can delete Token	7	delete_token
28	Can view Token	7	view_token
29	Can add auth	8	add_auth
30	Can change auth	8	change_auth
31	Can delete auth	8	delete_auth
32	Can view auth	8	view_auth
33	Can add key	9	add_key
34	Can change key	9	change_key
35	Can delete key	9	delete_key
36	Can view key	9	view_key
37	Can add census	10	add_census
38	Can change census	10	change_census
39	Can delete census	10	delete_census
40	Can view census	10	view_census
41	Can add mixnet	11	add_mixnet
42	Can change mixnet	11	change_mixnet
43	Can delete mixnet	11	delete_mixnet
44	Can view mixnet	11	view_mixnet
45	Can add vote	12	add_vote
46	Can change vote	12	change_vote
47	Can delete vote	12	delete_vote
48	Can view vote	12	view_vote
49	Can add question	13	add_question
50	Can change question	13	change_question
51	Can delete question	13	delete_question
52	Can view question	13	view_question
53	Can add question option	14	add_questionoption
54	Can change question option	14	change_questionoption
55	Can delete question option	14	delete_questionoption
56	Can view question option	14	view_questionoption
57	Can add voting	15	add_voting
58	Can change voting	15	change_voting
59	Can delete voting	15	delete_voting
60	Can view voting	15	view_voting
61	Can add backup	16	add_backup
62	Can change backup	16	change_backup
63	Can delete backup	16	delete_backup
64	Can view backup	16	view_backup
65	Can add completed task	17	add_completedtask
66	Can change completed task	17	change_completedtask
67	Can delete completed task	17	delete_completedtask
68	Can add task	18	add_task
69	Can change task	18	change_task
70	Can delete task	18	delete_task
71	Can add cron job log	19	add_cronjoblog
72	Can change cron job log	19	change_cronjoblog
73	Can delete cron job log	19	delete_cronjoblog
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$100000$4Ogb2ZCMeWhP$rVDtI8+TlHxKlnE71Hsecw4f9xjezNbu7EmY7SbIM+s=	\N	f	angel				f	t	2019-10-21 11:17:39.520664-07
3	pbkdf2_sha256$100000$sLbpydGKV9Pm$pfobHSHXhGhB+tlTVKxVsgWSdjZOQIPFpdwymdgvHUQ=	\N	f	rafael				f	t	2019-10-21 11:18:03.539343-07
4	pbkdf2_sha256$100000$i6uul67apNxl$FWxeX0hdJRiPuGNWmlCZ5XsRLXzRKn9/3n3A4DEhM30=	\N	t	root			root@root.es	t	t	2019-12-18 09:48:51.843463-08
1	pbkdf2_sha256$150000$sg0CULoO8mup$2kNuP9ZK3igWULhGz/v4Hr6/4ZIOnxs6b0L47AfUi/A=	2020-01-20 10:59:27.808112-08	t	decide			decide@decide.es	t	t	2019-10-16 11:00:38-07
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
21	1	1
22	1	2
23	1	3
24	1	4
25	1	5
26	1	6
27	1	7
28	1	8
29	1	9
30	1	10
31	1	11
32	1	12
33	1	13
34	1	14
35	1	15
36	1	16
37	1	17
38	1	18
39	1	19
40	1	20
41	1	21
42	1	22
43	1	23
44	1	24
45	1	25
46	1	26
47	1	27
48	1	28
49	1	29
50	1	30
51	1	31
52	1	32
53	1	33
54	1	34
55	1	35
56	1	36
57	1	37
58	1	38
59	1	39
60	1	40
61	1	41
62	1	42
63	1	43
64	1	44
65	1	45
66	1	46
67	1	47
68	1	48
69	1	49
70	1	50
71	1	51
72	1	52
73	1	53
74	1	54
75	1	55
76	1	56
77	1	57
78	1	58
79	1	59
80	1	60
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
b80d1c8dffea66ca5846f13fe2e8a5f18085cbbf	2019-11-18 08:10:16.768442-08	1
\.


--
-- Data for Name: background_task; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.background_task (id, task_name, task_params, task_hash, verbose_name, priority, run_at, repeat, repeat_until, queue, attempts, failed_at, last_error, locked_by, locked_at, creator_object_id, creator_content_type_id) FROM stdin;
\.


--
-- Data for Name: background_task_completedtask; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.background_task_completedtask (id, task_name, task_params, task_hash, verbose_name, priority, run_at, repeat, repeat_until, queue, attempts, failed_at, last_error, locked_by, locked_at, creator_object_id, creator_content_type_id) FROM stdin;
\.


--
-- Data for Name: base_auth; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.base_auth (id, name, url, me) FROM stdin;
2	localhost2	http://10.5.0.1:8000	f
1	localhost	http://localhost:8000	t
\.


--
-- Data for Name: base_key; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.base_key (id, p, g, y, x) FROM stdin;
1	68843129678006215830747311879305001188905360165869317514546160434877909040367	49459117172886838917652530481625294430948730410918770610016281655844162106691	20675998652558335856043345791651491615311610064797886965670146111118185538886	67949857535822301191024341959225424047433211071073343060375387471259978067216
2	64273597567638169008033868234035999127000320217723613818495980126431140080323	43602733405409624120188575732517601723437552221622605188662246332217748069294	42396847981962347274266648980994856737850189971628160874403423703913323515553	9842083278945629313583793870109886565974257471889780181490812283666347159506
3	60833587241511881472576259741952054221113423017675710697008951018529748766439	34055602338037200895197082267544174057217346973489374600311932717093581604572	40716585716419672651373971145591481001491312954688644778220026579287047199704	16522610629453014151244190638702147993351848334880762107063645463441247007529
4	60833587241511881472576259741952054221113423017675710697008951018529748766439	34055602338037200895197082267544174057217346973489374600311932717093581604572	40716585716419672651373971145591481001491312954688644778220026579287047199704	0
5	60833587241511881472576259741952054221113423017675710697008951018529748766439	34055602338037200895197082267544174057217346973489374600311932717093581604572	40716585716419672651373971145591481001491312954688644778220026579287047199704	0
6	107977696644988559595297031100471854565880822491964453977295149895952298075387	96558875163174003138251529371525535236495177239921019803944168404194978257602	2036771380911161940418993138085226039276301842044925558762119125375347699524	64077010391089599528736130981984377225834883365103049260418863473644505910805
7	98542447114898736923087843468017837828556433861570240198056835748761863366987	62573521335862565881124386259832166403363247192446963293569629723714629067320	32082558743338995062685541607332389984135721253889773875803541966839607811476	58604368249337605319535942231663497667288084634471704672447656849515279275104
8	93939272714402977404214770306277404883807091258767408816966299317929433703023	71666942795706191893099476066446546343442612461772629570139513994309416681597	7182688033260144233683473288298185867782354678019354013174347284057254596734	80780997439075959980098348571061134730770918286916871343763049338803741220699
9	93939272714402977404214770306277404883807091258767408816966299317929433703023	71666942795706191893099476066446546343442612461772629570139513994309416681597	7182688033260144233683473288298185867782354678019354013174347284057254596734	0
10	93939272714402977404214770306277404883807091258767408816966299317929433703023	71666942795706191893099476066446546343442612461772629570139513994309416681597	7182688033260144233683473288298185867782354678019354013174347284057254596734	0
\.


--
-- Data for Name: census_census; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.census_census (id, voting_id, voter_id) FROM stdin;
1	3	1
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2019-10-21 10:18:16.724767-07	1	¿Qué tamaño de la sala prefieres?	1	[{"added": {}}, {"added": {"name": "question option", "object": "Peque\\u00f1a (1)"}}, {"added": {"name": "question option", "object": "Mediana (2)"}}, {"added": {"name": "question option", "object": "Grande (3)"}}]	13	1
2	2019-10-21 10:20:41.730713-07	1	http://localhost:8000	1	[{"added": {}}]	8	1
3	2019-10-21 10:20:50.708845-07	2	http://10.5.0.1:8000	1	[{"added": {}}]	8	1
4	2019-10-21 10:20:54.022361-07	1	Tamaño de la sala	1	[{"added": {}}]	15	1
5	2019-10-21 10:23:33.429614-07	1	Tamaño de la sala	2	[{"changed": {"fields": ["auths"]}}]	15	1
6	2019-10-21 11:16:06.202831-07	2	¿Qué color de las mesas prefieres?	1	[{"added": {}}, {"added": {"name": "question option", "object": "Rojo (1)"}}, {"added": {"name": "question option", "object": "Verde (2)"}}, {"added": {"name": "question option", "object": "Azul (3)"}}]	13	1
7	2019-10-21 11:16:25.617935-07	2	Color de las mesas	1	[{"added": {}}]	15	1
8	2019-10-21 11:17:39.572683-07	2	angel	1	[{"added": {}}]	4	1
9	2019-10-21 11:18:03.595754-07	3	rafael	1	[{"added": {}}]	4	1
10	2019-11-18 08:03:33.39838-08	1	decide	2	[{"changed": {"fields": ["password"]}}]	4	1
11	2019-11-18 08:05:52.033212-08	1	decide	2	[{"changed": {"fields": ["user_permissions"]}}]	4	1
12	2019-11-18 08:06:43.03637-08	1	decide	2	[]	4	1
13	2019-11-18 08:07:42.302808-08	1	Dios	1	[{"added": {}}]	3	1
14	2019-11-18 08:08:00.607992-08	1	decide	2	[{"changed": {"fields": ["groups", "user_permissions"]}}]	4	1
15	2019-11-18 08:09:21.41772-08	2	Color de las mesas	2	[{"changed": {"fields": ["auths"]}}]	15	1
16	2019-11-18 08:09:49.763839-08	65488ec8452e38adf5faf5012fcdd886a068b955	65488ec8452e38adf5faf5012fcdd886a068b955	2	[]	7	1
17	2019-11-18 08:10:12.31523-08	65488ec8452e38adf5faf5012fcdd886a068b955	65488ec8452e38adf5faf5012fcdd886a068b955	3		7	1
18	2019-11-18 08:10:16.768908-08	b80d1c8dffea66ca5846f13fe2e8a5f18085cbbf	b80d1c8dffea66ca5846f13fe2e8a5f18085cbbf	1	[{"added": {}}]	7	1
19	2019-11-18 08:10:58.286427-08	1	http://localhost:8000	2	[{"changed": {"fields": ["me"]}}]	8	1
20	2019-11-18 08:11:08.036436-08	3	http://localhost:8000	3		8	1
21	2019-11-18 08:11:35.319633-08	2	Color de las mesas	2	[{"changed": {"fields": ["auths"]}}]	15	1
22	2019-11-18 08:13:30.711336-08	3	¿Prueba?	1	[{"added": {}}, {"added": {"name": "question option", "object": "S\\u00ed (1)"}}, {"added": {"name": "question option", "object": "No (2)"}}]	13	1
23	2019-11-18 08:13:36.375878-08	3	Prueba	1	[{"added": {}}]	15	1
24	2019-11-18 08:15:47.751259-08	3	Prueba	2	[{"changed": {"fields": ["auths"]}}]	15	1
25	2019-11-18 08:16:37.690451-08	1	decide	2	[{"changed": {"fields": ["user_permissions"]}}]	4	1
26	2019-11-18 08:18:08.38582-08	1	Census object (1)	1	[{"added": {}}]	10	1
27	2019-11-18 08:18:38.585622-08	1	Census object (1)	2	[{"changed": {"fields": ["voter_id"]}}]	10	1
28	2019-11-18 08:19:19.362754-08	1	Census object (1)	2	[{"changed": {"fields": ["voting_id"]}}]	10	1
29	2020-01-17 10:34:36.337857-08	1	2020-01-17	1	[{"added": {}}]	16	1
30	2020-01-17 10:34:43.529355-08	1	2020-01-17	3		16	1
31	2020-01-17 10:45:55.455004-08	2	2020-01-17 18:45:55.453329+00:00	1	[{"added": {}}]	16	1
32	2020-01-17 10:46:05.891895-08	2	2020-01-17	3		16	1
33	2020-01-17 11:00:23.580303-08	3	2020-01-17 19:00:23.578099+00:00	1	[{"added": {}}]	16	1
34	2020-01-21 14:04:27.637597-08	3	2020-01-17 00:00:00+00:00	3		16	1
35	2020-01-21 14:04:42.241087-08	4	2020-01-21 22:04:42.237886+00:00	1	[{"added": {}}]	16	1
36	2020-01-21 14:38:02.746977-08	5	2020-01-21 22:38:02.746086+00:00	1	[{"added": {}}]	16	1
37	2020-01-21 14:40:31.161507-08	5	2020-01-21 22:38:02.746086+00:00	3		16	1
38	2020-01-21 14:40:31.163743-08	4	2020-01-21 22:04:42.237886+00:00	3		16	1
39	2020-01-21 14:40:35.621813-08	6	2020-01-21 22:40:35.620875+00:00	1	[{"added": {}}]	16	1
40	2020-01-21 14:41:58.656055-08	6	2020-01-21 22:40:35.620875+00:00	3		16	1
41	2020-01-21 14:44:24.102904-08	7	2020-01-21 22:44:24.102039+00:00	1	[{"added": {}}]	16	1
42	2020-01-21 14:51:25.704086-08	7	2020-01-21 22:44:24.102039+00:00	3		16	1
43	2020-01-21 14:51:54.281812-08	8	2020-01-21 22:51:54.280917+00:00	1	[{"added": {}}]	16	1
44	2020-01-21 14:52:12.088605-08	8	2020-01-21 22:51:54.280917+00:00	3		16	1
45	2020-01-21 14:54:12.955865-08	9	2020-01-21 22:54:12.955001+00:00	1	[{"added": {}}]	16	1
46	2020-01-24 09:53:57.871152-08	9	Backup object (9)	3		16	1
47	2020-01-24 09:56:49.973296-08	12	Backup object (12)	1	[{"added": {}}]	16	1
48	2020-01-24 09:57:10.959558-08	12	Backup object (12)	3		16	1
49	2020-01-24 09:57:21.308829-08	13	Backup object (13)	1	[{"added": {}}]	16	1
50	2020-01-24 10:01:32.286256-08	13	Backup object (13)	3		16	1
51	2020-01-24 10:01:40.597583-08	14	Backup object (14)	1	[{"added": {}}]	16	1
52	2020-01-24 10:15:35.903695-08	14	Backup object (14)	3		16	1
53	2020-01-24 10:15:44.867629-08	15	Backup object (15)	1	[{"added": {}}]	16	1
54	2020-01-24 10:15:57.507121-08	16	Backup object (16)	1	[{"added": {}}]	16	1
55	2020-01-24 10:18:08.319118-08	16	Backup object (16)	3		16	1
56	2020-01-24 10:18:08.32101-08	15	Backup object (15)	3		16	1
57	2020-01-24 10:18:16.490781-08	17	Backup object (17)	1	[{"added": {}}]	16	1
58	2020-01-24 10:18:22.428314-08	17	Backup object (17)	3		16	1
59	2020-01-24 11:12:04.922167-08	18	Backup object (18)	1	[{"added": {}}]	16	1
60	2020-01-24 11:12:09.377953-08	18	Backup object (18)	3		16	1
61	2020-01-26 10:09:54.575789-08	19	Backup object (19)	1	[{"added": {}}]	16	1
62	2020-01-26 10:10:00.964783-08	19	Backup object (19)	3		16	1
63	2020-01-26 10:19:50.49504-08	20	Backup object (20)	1	[{"added": {}}]	16	1
64	2020-01-26 10:19:59.93309-08	20	Backup object (20)	3		16	1
65	2020-01-26 10:20:12.39588-08	21	Backup object (21)	1	[{"added": {}}]	16	1
66	2020-01-26 10:20:15.562861-08	21	Backup object (21)	3		16	1
67	2020-01-26 10:20:44.68929-08	22	Backup object (22)	1	[{"added": {}}]	16	1
68	2020-01-26 10:20:50.062236-08	22	Backup object (22)	3		16	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	authtoken	token
8	base	auth
9	base	key
10	census	census
11	mixnet	mixnet
12	store	vote
13	voting	question
14	voting	questionoption
15	voting	voting
16	store	backup
17	background_task	completedtask
18	background_task	task
19	django_cron	cronjoblog
\.


--
-- Data for Name: django_cron_cronjoblog; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.django_cron_cronjoblog (id, code, start_time, end_time, is_success, message, ran_at_time) FROM stdin;
1	decide.cron.auto_backups	2020-01-22 11:48:21.501133-08	2020-01-22 11:48:21.519906-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\n  File "/home/riokaru/EGC/decidegiratina/decide/decide/store/auto_backups.py", line 9, in do\n    management.call_command('dbbackup')\nNameError: name 'management' is not defined\n	\N
2	decide.cron.auto_backups	2020-01-22 11:50:14.155057-08	2020-01-22 11:50:14.166772-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\n  File "/home/riokaru/EGC/decidegiratina/decide/decide/store/auto_backups.py", line 9, in do\n    management.call_command('dbbackup')\nNameError: name 'management' is not defined\n	\N
3	decide.cron.auto_backups	2020-01-22 11:52:28.965216-08	2020-01-22 11:52:28.976653-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\n  File "/home/riokaru/EGC/decidegiratina/decide/decide/store/auto_backups.py", line 9, in do\n    management.call_command('dbbackup')\nNameError: name 'management' is not defined\n	\N
4	decide.cron.auto_backups	2020-01-22 11:52:29.011832-08	2020-01-22 11:52:29.01949-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\n  File "/home/riokaru/EGC/decidegiratina/decide/decide/store/auto_backups.py", line 9, in do\n    management.call_command('dbbackup')\nNameError: name 'management' is not defined\n	\N
5	store.auto_backups.auto_backups	2020-01-22 13:46:49.700021-08	2020-01-22 13:46:49.716173-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\n  File "/home/riokaru/EGC/decidegiratina/decide/decide/store/auto_backups.py", line 9, in do\n    management.call_command('dbbackup')\nNameError: name 'management' is not defined\n	\N
6	store.auto_backups.auto_backups	2020-01-22 13:48:11.443129-08	2020-01-22 13:48:11.665929-08	t		\N
7	store.auto_backups.auto_backups	2020-01-22 13:54:02.700016-08	2020-01-22 13:54:02.913125-08	t		\N
8	store.auto_backups.auto_backups	2020-01-22 13:55:20.537631-08	2020-01-22 13:55:20.747456-08	t		\N
9	store.auto_backups.auto_backups	2020-01-22 13:58:34.350324-08	2020-01-22 13:58:34.598801-08	t		\N
10	store.auto_backups.auto_backups	2020-01-22 13:59:38.375194-08	2020-01-22 13:59:38.585866-08	t		\N
11	store.auto_backups.auto_backups	2020-01-22 14:26:03.537688-08	2020-01-22 14:26:03.742019-08	t		22:26:00
12	store.auto_backups.auto_backups	2020-01-22 14:33:12.633567-08	2020-01-22 14:33:12.85291-08	t		22:33:00
13	store.auto_backups.auto_backups	2020-01-22 14:40:21.224497-08	2020-01-22 14:40:21.441332-08	t		22:34:00
14	store.auto_backups.auto_backups	2020-01-22 14:40:21.882749-08	2020-01-22 14:40:22.108891-08	t		22:35:00
15	store.auto_backups.auto_backups	2020-01-22 14:43:06.562386-08	2020-01-22 14:43:06.822205-08	t		22:42:00
16	store.auto_backups.auto_backups	2020-01-22 14:44:40.694071-08	2020-01-22 14:44:40.911182-08	t		22:43:00
17	store.auto_backups.auto_backups	2020-01-22 14:45:58.328572-08	2020-01-22 14:45:58.544304-08	t		22:44:00
18	store.auto_backups.auto_backups	2020-01-24 09:48:08.99278-08	2020-01-24 09:48:09.360835-08	t		\N
19	store.auto_backups.auto_backups	2020-01-24 09:51:44.773621-08	2020-01-24 09:51:44.992568-08	t		\N
20	store.auto_backups.auto_backups	2020-01-24 09:53:04.681689-08	2020-01-24 09:53:04.904806-08	t		\N
21	store.auto_backups.auto_backups	2020-01-24 09:55:27.037182-08	2020-01-24 09:55:27.253205-08	t		\N
22	store.auto_backups.auto_backups	2020-01-24 09:56:28.475481-08	2020-01-24 09:56:28.673293-08	t		\N
23	store.auto_backups.auto_backups	2020-01-24 09:57:56.780121-08	2020-01-24 09:57:56.98883-08	t		\N
24	store.auto_backups.auto_backups	2020-01-24 09:59:23.809841-08	2020-01-24 09:59:24.017574-08	t		\N
25	store.auto_backups.auto_backups	2020-01-24 10:01:04.264243-08	2020-01-24 10:01:04.26525-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
26	store.auto_backups.auto_backups	2020-01-24 10:01:04.297574-08	2020-01-24 10:01:04.29796-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
27	store.auto_backups.auto_backups	2020-01-24 10:01:12.898873-08	2020-01-24 10:01:12.899712-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
28	store.auto_backups.auto_backups	2020-01-24 10:01:12.918364-08	2020-01-24 10:01:12.918572-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
29	store.auto_backups.auto_backups	2020-01-24 10:01:13.319591-08	2020-01-24 10:01:13.320448-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
30	store.auto_backups.auto_backups	2020-01-24 10:01:13.339418-08	2020-01-24 10:01:13.339628-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
31	store.auto_backups.auto_backups	2020-01-24 10:01:59.986444-08	2020-01-24 10:02:00.347444-08	t		\N
32	store.auto_backups.auto_backups	2020-01-24 10:03:43.389548-08	2020-01-24 10:03:43.390409-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
33	store.auto_backups.auto_backups	2020-01-24 10:03:43.409528-08	2020-01-24 10:03:43.409738-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
34	store.auto_backups.auto_backups	2020-01-24 10:03:45.836776-08	2020-01-24 10:03:45.837649-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
35	store.auto_backups.auto_backups	2020-01-24 10:03:45.856251-08	2020-01-24 10:03:45.856453-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
36	store.auto_backups.auto_backups	2020-01-24 10:03:45.895938-08	2020-01-24 10:03:45.896149-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
37	store.auto_backups.auto_backups	2020-01-24 10:03:47.10797-08	2020-01-24 10:03:47.108822-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
38	store.auto_backups.auto_backups	2020-01-24 10:03:47.127512-08	2020-01-24 10:03:47.12772-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
39	store.auto_backups.auto_backups	2020-01-24 10:03:47.167578-08	2020-01-24 10:03:47.167791-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
40	store.auto_backups.auto_backups	2020-01-24 10:04:38.270818-08	2020-01-24 10:04:38.271669-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
41	store.auto_backups.auto_backups	2020-01-24 10:04:38.290314-08	2020-01-24 10:04:38.290521-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 213, in run\n    if self.should_run_now(force):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 102, in should_run_now\n    if cron_job.schedule.run_every_mins is not None:\nAttributeError: 'auto_backups' object has no attribute 'schedule'\n	\N
42	store.auto_backups.auto_backups	2020-01-24 10:04:59.255685-08	2020-01-24 10:04:59.461254-08	t		\N
43	store.auto_backups.auto_backups	2020-01-24 10:05:59.798499-08	2020-01-24 10:06:00.035615-08	t		\N
44	store.auto_backups.auto_backups	2020-01-24 10:10:39.380256-08	2020-01-24 10:10:39.391957-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
168	store.auto_backups.auto_backups	2020-01-26 15:45:19.718627-08	2020-01-26 15:45:19.949917-08	t		\N
45	store.auto_backups.auto_backups	2020-01-24 10:11:01.589546-08	2020-01-24 10:11:01.601578-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
46	store.auto_backups.auto_backups	2020-01-24 10:11:12.968535-08	2020-01-24 10:11:12.991361-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
47	store.auto_backups.auto_backups	2020-01-24 10:11:13.279035-08	2020-01-24 10:11:13.287394-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
48	store.auto_backups.auto_backups	2020-01-24 10:11:22.270976-08	2020-01-24 10:11:22.284184-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
49	store.auto_backups.auto_backups	2020-01-24 10:11:22.632257-08	2020-01-24 10:11:22.649212-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
50	store.auto_backups.auto_backups	2020-01-24 10:11:45.003023-08	2020-01-24 10:11:45.039043-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
51	store.auto_backups.auto_backups	2020-01-24 10:11:45.568343-08	2020-01-24 10:11:45.581356-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
52	store.auto_backups.auto_backups	2020-01-24 10:11:59.802067-08	2020-01-24 10:11:59.817176-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
53	store.auto_backups.auto_backups	2020-01-24 10:12:00.060253-08	2020-01-24 10:12:00.069541-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
54	store.auto_backups.auto_backups	2020-01-24 10:12:00.577138-08	2020-01-24 10:12:00.588801-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
55	store.auto_backups.auto_backups	2020-01-24 10:12:40.383593-08	2020-01-24 10:12:40.396365-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
56	store.auto_backups.auto_backups	2020-01-24 10:13:03.401412-08	2020-01-24 10:13:03.417943-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
57	store.auto_backups.auto_backups	2020-01-24 10:13:03.635265-08	2020-01-24 10:13:03.644441-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
58	store.auto_backups.auto_backups	2020-01-24 10:13:04.148451-08	2020-01-24 10:13:04.157365-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
59	store.auto_backups.auto_backups	2020-01-24 10:13:27.921602-08	2020-01-24 10:13:27.934936-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
60	store.auto_backups.auto_backups	2020-01-24 10:13:28.167747-08	2020-01-24 10:13:28.176256-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
169	store.auto_backups.auto_backups	2020-01-26 15:47:18.194378-08	2020-01-26 15:47:18.415642-08	t		\N
172	store.auto_backups.auto_backups	2020-01-26 15:50:42.414884-08	2020-01-26 15:50:42.633738-08	t		\N
175	store.auto_backups.auto_backups	2020-01-26 15:55:42.581886-08	2020-01-26 15:55:42.812073-08	t		\N
61	store.auto_backups.auto_backups	2020-01-24 10:13:28.801256-08	2020-01-24 10:13:28.812843-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
62	store.auto_backups.auto_backups	2020-01-24 10:13:29.018147-08	2020-01-24 10:13:29.026524-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
63	store.auto_backups.auto_backups	2020-01-24 10:13:29.464718-08	2020-01-24 10:13:29.47612-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
64	store.auto_backups.auto_backups	2020-01-24 10:13:57.162793-08	2020-01-24 10:13:57.177575-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
65	store.auto_backups.auto_backups	2020-01-24 10:13:57.404674-08	2020-01-24 10:13:57.414237-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
66	store.auto_backups.auto_backups	2020-01-24 10:13:57.900113-08	2020-01-24 10:13:57.908874-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
67	store.auto_backups.auto_backups	2020-01-24 10:14:01.287646-08	2020-01-24 10:14:01.300603-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
68	store.auto_backups.auto_backups	2020-01-24 10:14:01.532401-08	2020-01-24 10:14:01.541199-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
69	store.auto_backups.auto_backups	2020-01-24 10:14:02.001161-08	2020-01-24 10:14:02.012209-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
70	store.auto_backups.auto_backups	2020-01-24 10:15:25.497983-08	2020-01-24 10:15:25.510877-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
71	store.auto_backups.auto_backups	2020-01-24 10:15:25.775945-08	2020-01-24 10:15:25.78623-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
72	store.auto_backups.auto_backups	2020-01-24 10:15:26.340105-08	2020-01-24 10:15:26.348973-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
73	store.auto_backups.auto_backups	2020-01-24 10:17:56.73729-08	2020-01-24 10:17:56.750786-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
74	store.auto_backups.auto_backups	2020-01-24 10:17:56.970614-08	2020-01-24 10:17:56.978852-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
75	store.auto_backups.auto_backups	2020-01-24 10:17:57.438171-08	2020-01-24 10:17:57.446926-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
76	store.auto_backups.auto_backups	2020-01-24 10:19:22.938264-08	2020-01-24 10:19:22.951855-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
170	store.auto_backups.auto_backups	2020-01-26 15:48:18.783644-08	2020-01-26 15:48:19.028863-08	t		\N
173	store.auto_backups.auto_backups	2020-01-26 15:52:57.789523-08	2020-01-26 15:52:58.006175-08	t		\N
176	store.auto_backups.auto_backups	2020-01-26 15:58:44.204817-08	2020-01-26 15:58:44.466232-08	t		\N
77	store.auto_backups.auto_backups	2020-01-24 10:19:23.2167-08	2020-01-24 10:19:23.236676-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
78	store.auto_backups.auto_backups	2020-01-24 10:19:23.934247-08	2020-01-24 10:19:23.944728-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
79	store.auto_backups.auto_backups	2020-01-24 10:22:49.857001-08	2020-01-24 10:22:49.86991-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
80	store.auto_backups.auto_backups	2020-01-24 10:22:50.109021-08	2020-01-24 10:22:50.118688-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
81	store.auto_backups.auto_backups	2020-01-24 10:22:50.382564-08	2020-01-24 10:22:50.392556-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
82	store.auto_backups.auto_backups	2020-01-24 10:22:59.863568-08	2020-01-24 10:22:59.88369-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
83	store.auto_backups.auto_backups	2020-01-24 10:23:00.2379-08	2020-01-24 10:23:00.253246-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
84	store.auto_backups.auto_backups	2020-01-24 10:23:00.656676-08	2020-01-24 10:23:00.671227-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
85	store.auto_backups.auto_backups	2020-01-24 10:23:23.565364-08	2020-01-24 10:23:23.579197-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
86	store.auto_backups.auto_backups	2020-01-24 10:23:23.837905-08	2020-01-24 10:23:23.856696-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
87	store.auto_backups.auto_backups	2020-01-24 10:23:43.840527-08	2020-01-24 10:23:43.852187-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
88	store.auto_backups.auto_backups	2020-01-24 10:23:43.864711-08	2020-01-24 10:23:43.872696-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
89	store.auto_backups.auto_backups	2020-01-24 10:24:10.048297-08	2020-01-24 10:24:10.071826-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
90	store.auto_backups.auto_backups	2020-01-24 10:24:27.15177-08	2020-01-24 10:24:27.165678-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
91	store.auto_backups.auto_backups	2020-01-24 10:24:34.605128-08	2020-01-24 10:24:34.616475-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
92	store.auto_backups.auto_backups	2020-01-24 10:24:35.239594-08	2020-01-24 10:24:35.251224-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
171	store.auto_backups.auto_backups	2020-01-26 15:49:39.190863-08	2020-01-26 15:49:39.429604-08	t		\N
174	store.auto_backups.auto_backups	2020-01-26 15:54:07.689455-08	2020-01-26 15:54:07.953196-08	t		\N
177	store.auto_backups.auto_backups	2020-01-26 16:00:01.572992-08	2020-01-26 16:00:01.828555-08	t		\N
93	store.auto_backups.auto_backups	2020-01-24 10:30:04.750509-08	2020-01-24 10:30:04.802923-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
94	store.auto_backups.auto_backups	2020-01-24 10:31:27.204436-08	2020-01-24 10:31:27.215954-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
95	store.auto_backups.auto_backups	2020-01-24 10:31:27.226962-08	2020-01-24 10:31:27.234498-08	f	Traceback (most recent call last):\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/management/commands/runcrons.py", line 71, in run_cron_with_cache_check\n    manager.run(force)\n  File "/home/riokaru/.local/lib/python3.6/site-packages/django_cron/__init__.py", line 215, in run\n    self.msg = self.cron_job.do()\nAttributeError: 'auto_backups' object has no attribute 'do'\n	\N
96	store.auto_backups.auto_backups	2020-01-24 10:35:02.040169-08	2020-01-24 10:35:02.252412-08	t		\N
97	store.auto_backups.auto_backups	2020-01-24 10:47:33.945661-08	2020-01-24 10:47:34.256822-08	t		\N
98	store.auto_backups.auto_backups	2020-01-24 10:54:56.880822-08	2020-01-24 10:54:57.125552-08	t		\N
99	store.auto_backups.auto_backups	2020-01-24 11:10:03.546326-08	2020-01-24 11:10:03.780372-08	t		\N
100	store.auto_backups.auto_backups	2020-01-24 11:11:30.807325-08	2020-01-24 11:11:31.063405-08	t		\N
101	store.auto_backups.auto_backups	2020-01-24 11:12:31.669343-08	2020-01-24 11:12:31.903642-08	t		\N
102	store.auto_backups.auto_backups	2020-01-24 11:13:37.679736-08	2020-01-24 11:13:37.945279-08	t		\N
103	store.auto_backups.auto_backups	2020-01-24 11:17:24.011751-08	2020-01-24 11:17:24.247393-08	t		\N
104	store.auto_backups.auto_backups	2020-01-26 10:00:53.867369-08	2020-01-26 10:00:54.26699-08	t		\N
105	store.auto_backups.auto_backups	2020-01-26 10:09:29.563193-08	2020-01-26 10:09:29.773225-08	t		\N
106	store.auto_backups.auto_backups	2020-01-26 10:10:45.016361-08	2020-01-26 10:10:45.238187-08	t		\N
107	store.auto_backups.auto_backups	2020-01-26 10:13:53.614875-08	2020-01-26 10:13:53.833187-08	t		\N
108	store.auto_backups.auto_backups	2020-01-26 10:17:49.919422-08	2020-01-26 10:17:50.220003-08	t		\N
109	store.auto_backups.auto_backups	2020-01-26 10:19:09.088296-08	2020-01-26 10:19:09.313761-08	t		\N
110	store.auto_backups.auto_backups	2020-01-26 10:20:25.993929-08	2020-01-26 10:20:26.231672-08	t		\N
111	store.auto_backups.auto_backups	2020-01-26 10:22:37.760775-08	2020-01-26 10:22:37.989987-08	t		\N
112	store.auto_backups.auto_backups	2020-01-26 10:30:19.765229-08	2020-01-26 10:30:20.147764-08	t		\N
113	store.auto_backups.auto_backups	2020-01-26 10:33:42.647302-08	2020-01-26 10:33:43.03337-08	t		\N
114	store.auto_backups.auto_backups	2020-01-26 10:36:03.990574-08	2020-01-26 10:36:04.249222-08	t		\N
115	store.auto_backups.auto_backups	2020-01-26 10:37:27.363172-08	2020-01-26 10:37:27.575202-08	t		\N
116	store.auto_backups.auto_backups	2020-01-26 10:38:44.771285-08	2020-01-26 10:38:44.97983-08	t		\N
117	store.auto_backups.auto_backups	2020-01-26 10:39:50.2577-08	2020-01-26 10:39:50.458117-08	t		\N
118	store.auto_backups.auto_backups	2020-01-26 10:40:52.885466-08	2020-01-26 10:40:53.076529-08	t		\N
119	store.auto_backups.auto_backups	2020-01-26 10:41:57.39373-08	2020-01-26 10:41:57.623208-08	t		\N
120	store.auto_backups.auto_backups	2020-01-26 11:09:22.097438-08	2020-01-26 11:09:22.319058-08	t		\N
121	store.auto_backups.auto_backups	2020-01-26 11:12:24.369569-08	2020-01-26 11:12:24.586966-08	t		\N
122	store.auto_backups.auto_backups	2020-01-26 11:13:52.095449-08	2020-01-26 11:13:52.321855-08	t		\N
123	store.auto_backups.auto_backups	2020-01-26 11:15:12.208184-08	2020-01-26 11:15:12.497089-08	t		\N
124	store.auto_backups.auto_backups	2020-01-26 11:16:46.236702-08	2020-01-26 11:16:46.457915-08	t		\N
125	store.auto_backups.auto_backups	2020-01-26 11:18:08.168763-08	2020-01-26 11:18:08.385005-08	t		\N
126	store.auto_backups.auto_backups	2020-01-26 11:22:54.615652-08	2020-01-26 11:22:54.908925-08	t		\N
127	store.auto_backups.auto_backups	2020-01-26 11:24:12.748577-08	2020-01-26 11:24:12.969153-08	t		\N
128	store.auto_backups.auto_backups	2020-01-26 11:25:49.086293-08	2020-01-26 11:25:49.304939-08	t		\N
129	store.auto_backups.auto_backups	2020-01-26 11:31:27.376948-08	2020-01-26 11:31:27.588156-08	t		\N
130	store.auto_backups.auto_backups	2020-01-26 11:42:36.530925-08	2020-01-26 11:42:36.794161-08	t		\N
131	store.auto_backups.auto_backups	2020-01-26 11:43:51.087441-08	2020-01-26 11:43:51.317138-08	t		\N
132	store.auto_backups.auto_backups	2020-01-26 11:45:08.125285-08	2020-01-26 11:45:08.352274-08	t		\N
133	store.auto_backups.auto_backups	2020-01-26 11:46:20.132952-08	2020-01-26 11:46:20.397731-08	t		\N
134	store.auto_backups.auto_backups	2020-01-26 12:03:55.2922-08	2020-01-26 12:03:55.498544-08	t		\N
135	store.auto_backups.auto_backups	2020-01-26 12:05:31.866024-08	2020-01-26 12:05:32.117275-08	t		\N
136	store.auto_backups.auto_backups	2020-01-26 12:06:44.694762-08	2020-01-26 12:06:44.939192-08	t		\N
137	store.auto_backups.auto_backups	2020-01-26 12:07:57.967965-08	2020-01-26 12:07:58.196085-08	t		\N
138	store.auto_backups.auto_backups	2020-01-26 12:15:21.587638-08	2020-01-26 12:15:21.818927-08	t		\N
139	store.auto_backups.auto_backups	2020-01-26 12:17:32.852777-08	2020-01-26 12:17:33.086555-08	t		\N
140	store.auto_backups.auto_backups	2020-01-26 12:19:21.101938-08	2020-01-26 12:19:21.313539-08	t		\N
141	store.auto_backups.auto_backups	2020-01-26 12:20:21.686802-08	2020-01-26 12:20:21.906669-08	t		\N
142	store.auto_backups.auto_backups	2020-01-26 12:27:34.862542-08	2020-01-26 12:27:35.402724-08	t		\N
143	store.auto_backups.auto_backups	2020-01-26 12:29:09.911225-08	2020-01-26 12:29:10.381334-08	t		\N
144	store.auto_backups.auto_backups	2020-01-26 12:33:21.370875-08	2020-01-26 12:33:21.64881-08	t		\N
145	store.auto_backups.auto_backups	2020-01-26 12:35:25.524598-08	2020-01-26 12:35:25.767064-08	t		\N
146	store.auto_backups.auto_backups	2020-01-26 12:37:11.44881-08	2020-01-26 12:37:11.703888-08	t		\N
147	store.auto_backups.auto_backups	2020-01-26 12:41:24.321207-08	2020-01-26 12:41:24.638253-08	t		\N
148	store.auto_backups.auto_backups	2020-01-26 12:47:00.620659-08	2020-01-26 12:47:00.882393-08	t		\N
149	store.auto_backups.auto_backups	2020-01-26 13:57:59.262939-08	2020-01-26 13:57:59.619198-08	t		\N
150	store.auto_backups.auto_backups	2020-01-26 14:00:28.196856-08	2020-01-26 14:00:28.41056-08	t		\N
151	store.auto_backups.auto_backups	2020-01-26 14:04:32.459638-08	2020-01-26 14:04:32.724497-08	t		\N
152	store.auto_backups.auto_backups	2020-01-26 14:06:49.903888-08	2020-01-26 14:06:50.116258-08	t		\N
153	store.auto_backups.auto_backups	2020-01-26 14:10:09.870718-08	2020-01-26 14:10:10.083431-08	t		\N
154	store.auto_backups.auto_backups	2020-01-26 14:12:33.491051-08	2020-01-26 14:12:33.726403-08	t		\N
155	store.auto_backups.auto_backups	2020-01-26 14:56:56.595585-08	2020-01-26 14:56:56.86478-08	t		\N
156	store.auto_backups.auto_backups	2020-01-26 15:00:31.448511-08	2020-01-26 15:00:31.724798-08	t		\N
157	store.auto_backups.auto_backups	2020-01-26 15:01:52.136006-08	2020-01-26 15:01:52.364551-08	t		\N
158	store.auto_backups.auto_backups	2020-01-26 15:02:56.789087-08	2020-01-26 15:02:57.162063-08	t		\N
159	store.auto_backups.auto_backups	2020-01-26 15:04:59.103727-08	2020-01-26 15:04:59.408116-08	t		\N
160	store.auto_backups.auto_backups	2020-01-26 15:11:48.867195-08	2020-01-26 15:11:49.188504-08	t		\N
161	store.auto_backups.auto_backups	2020-01-26 15:30:59.119448-08	2020-01-26 15:30:59.346957-08	t		\N
162	store.auto_backups.auto_backups	2020-01-26 15:32:19.032418-08	2020-01-26 15:32:19.274979-08	t		\N
163	store.auto_backups.auto_backups	2020-01-26 15:33:42.986005-08	2020-01-26 15:33:43.22973-08	t		\N
164	store.auto_backups.auto_backups	2020-01-26 15:36:44.508888-08	2020-01-26 15:36:44.735177-08	t		\N
165	store.auto_backups.auto_backups	2020-01-26 15:38:46.20357-08	2020-01-26 15:38:46.438193-08	t		\N
166	store.auto_backups.auto_backups	2020-01-26 15:42:20.311319-08	2020-01-26 15:42:20.544641-08	t		\N
167	store.auto_backups.auto_backups	2020-01-26 15:44:17.907105-08	2020-01-26 15:44:18.141996-08	t		\N
178	store.auto_backups.auto_backups	2020-01-26 16:22:56.885487-08	2020-01-26 16:22:57.125179-08	t		\N
179	store.auto_backups.auto_backups	2020-01-26 16:24:20.860626-08	2020-01-26 16:24:21.073498-08	t		\N
180	store.auto_backups.auto_backups	2020-01-26 16:32:43.096546-08	2020-01-26 16:32:43.332542-08	t		\N
181	store.auto_backups.auto_backups	2020-01-26 16:34:00.72956-08	2020-01-26 16:34:00.985126-08	t		\N
182	store.auto_backups.auto_backups	2020-01-26 16:40:20.609716-08	2020-01-26 16:40:20.847017-08	t		\N
183	store.auto_backups.auto_backups	2020-01-26 16:41:45.986525-08	2020-01-26 16:41:46.286705-08	t		\N
184	store.auto_backups.auto_backups	2020-01-26 16:42:50.238823-08	2020-01-26 16:42:50.469329-08	t		\N
185	store.auto_backups.auto_backups	2020-01-26 16:44:31.607572-08	2020-01-26 16:44:31.868998-08	t		\N
186	store.auto_backups.auto_backups	2020-01-26 16:45:51.833407-08	2020-01-26 16:45:52.101134-08	t		\N
187	store.auto_backups.auto_backups	2020-01-26 16:52:49.062471-08	2020-01-26 16:52:49.349437-08	t		\N
188	store.auto_backups.auto_backups	2020-01-26 16:55:49.428019-08	2020-01-26 16:55:49.695418-08	t		\N
189	store.auto_backups.auto_backups	2020-01-26 16:58:29.105453-08	2020-01-26 16:58:29.367269-08	t		\N
190	store.auto_backups.auto_backups	2020-01-26 16:59:47.935102-08	2020-01-26 16:59:48.323669-08	t		\N
191	store.auto_backups.auto_backups	2020-01-26 17:00:49.918565-08	2020-01-26 17:00:50.167428-08	t		\N
192	store.auto_backups.auto_backups	2020-01-26 17:03:03.922045-08	2020-01-26 17:03:04.155151-08	t		\N
193	store.auto_backups.auto_backups	2020-01-26 17:04:40.690062-08	2020-01-26 17:04:40.9578-08	t		\N
194	store.auto_backups.auto_backups	2020-01-26 17:06:17.343913-08	2020-01-26 17:06:17.594471-08	t		\N
195	store.auto_backups.auto_backups	2020-01-26 17:22:15.996087-08	2020-01-26 17:22:16.221096-08	t		\N
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2019-10-16 10:59:42.746955-07
2	auth	0001_initial	2019-10-16 10:59:42.780992-07
3	admin	0001_initial	2019-10-16 10:59:42.821939-07
4	admin	0002_logentry_remove_auto_add	2019-10-16 10:59:42.833373-07
5	admin	0003_logentry_add_action_flag_choices	2019-10-16 10:59:42.842525-07
6	contenttypes	0002_remove_content_type_name	2019-10-16 10:59:42.859886-07
7	auth	0002_alter_permission_name_max_length	2019-10-16 10:59:42.864239-07
8	auth	0003_alter_user_email_max_length	2019-10-16 10:59:42.873814-07
9	auth	0004_alter_user_username_opts	2019-10-16 10:59:42.881797-07
10	auth	0005_alter_user_last_login_null	2019-10-16 10:59:42.88913-07
11	auth	0006_require_contenttypes_0002	2019-10-16 10:59:42.891008-07
12	auth	0007_alter_validators_add_error_messages	2019-10-16 10:59:42.897459-07
13	auth	0008_alter_user_username_max_length	2019-10-16 10:59:42.909579-07
14	auth	0009_alter_user_last_name_max_length	2019-10-16 10:59:42.919056-07
15	auth	0010_alter_group_name_max_length	2019-10-16 10:59:42.925986-07
16	auth	0011_update_proxy_permissions	2019-10-16 10:59:42.933992-07
17	authtoken	0001_initial	2019-10-16 10:59:42.945873-07
18	authtoken	0002_auto_20160226_1747	2019-10-16 10:59:42.981958-07
19	base	0001_initial	2019-10-16 10:59:42.990557-07
20	base	0002_auto_20180921_1056	2019-10-16 10:59:43.011393-07
21	base	0003_auto_20180921_1119	2019-10-16 10:59:43.036755-07
22	census	0001_initial	2019-10-16 10:59:43.047187-07
23	mixnet	0001_initial	2019-10-16 10:59:43.065945-07
24	mixnet	0002_auto_20180216_1617	2019-10-16 10:59:43.086445-07
25	voting	0001_initial	2019-10-16 10:59:43.115244-07
26	voting	0002_auto_20180302_1100	2019-10-16 10:59:43.14039-07
27	voting	0003_auto_20180605_0842	2019-10-16 10:59:43.168456-07
28	mixnet	0003_mixnet_auth_position	2019-10-16 10:59:43.179707-07
29	mixnet	0004_auto_20180605_0842	2019-10-16 10:59:43.238296-07
30	sessions	0001_initial	2019-10-16 10:59:43.244906-07
31	store	0001_initial	2019-10-16 10:59:43.253884-07
32	store	0002_vote_voted	2019-10-16 10:59:43.259936-07
33	store	0003_auto_20180921_1522	2019-10-16 10:59:43.285353-07
34	store	0004_backup	2020-01-17 10:32:50.243215-08
35	background_task	0001_initial	2020-01-21 11:40:39.22472-08
36	background_task	0002_auto_20170927_1109	2020-01-21 11:40:39.244339-08
37	admin	0004_auto_20200121_2203	2020-01-21 14:04:09.880146-08
38	auth	0012_auto_20200121_2203	2020-01-21 14:04:09.905995-08
39	store	0005_auto_20200121_2203	2020-01-21 14:04:09.924377-08
40	django_cron	0001_initial	2020-01-21 14:58:38.303797-08
41	django_cron	0002_remove_max_length_from_CronJobLog_message	2020-01-21 14:58:38.307724-08
42	store	0006_auto_20200124_1756	2020-01-24 09:56:33.841409-08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
ehh3crmb27zwlxwtywok13gvtpciwz33	YTM5ZGU4YmY2ZWU1ZjNiMDFlZTA4NDMwYmU1OGE2YjMwZGQxM2E1Yjp7ImF1dGgtdG9rZW4iOiI1NjM2NjI5MmM1M2M0MjAyZGI0NGY1MjUxMDFkZWQyNTBkZmQ0OTJlIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJiYXNlLmJhY2tlbmRzLkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTNkMGI0YjRmYWNmNTQwMDdjZjkxNWIxMjU4YjZkNWVkY2EwNGFkZSJ9	2019-11-04 09:17:20.061385-08
hpsmuf93ukv2pxjs7mv10xuhga0t78fe	NjhjNTAxOTIzYTI0OTI1OWQwZjA5ODU3ODllMjJhYmMzYThlYjc2OTp7ImF1dGgtdG9rZW4iOiJiODBkMWM4ZGZmZWE2NmNhNTg0NmYxM2ZlMmU4YTVmMTgwODVjYmJmIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJiYXNlLmJhY2tlbmRzLkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTRhZTJlMmY1ZWM0MDI2NGQ1OGZhZjhiYTI4Y2YyZmJkNjIzNmE1NyJ9	2019-12-02 08:16:42.153674-08
558l14pjk0w4dif5w55o3ffusluhj4nx	NjhjNTAxOTIzYTI0OTI1OWQwZjA5ODU3ODllMjJhYmMzYThlYjc2OTp7ImF1dGgtdG9rZW4iOiJiODBkMWM4ZGZmZWE2NmNhNTg0NmYxM2ZlMmU4YTVmMTgwODVjYmJmIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJiYXNlLmJhY2tlbmRzLkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTRhZTJlMmY1ZWM0MDI2NGQ1OGZhZjhiYTI4Y2YyZmJkNjIzNmE1NyJ9	2020-01-28 10:30:43.232788-08
xkrpgl7oq584ru91doar3yfkmm4ac8tm	NjhjNTAxOTIzYTI0OTI1OWQwZjA5ODU3ODllMjJhYmMzYThlYjc2OTp7ImF1dGgtdG9rZW4iOiJiODBkMWM4ZGZmZWE2NmNhNTg0NmYxM2ZlMmU4YTVmMTgwODVjYmJmIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJiYXNlLmJhY2tlbmRzLkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiOTRhZTJlMmY1ZWM0MDI2NGQ1OGZhZjhiYTI4Y2YyZmJkNjIzNmE1NyJ9	2020-01-31 10:22:12.896057-08
qhu1sx4ifvf8dm84wv8g9djoeuxw1qt2	NjdkMmI0Y2IwZjE1OTFmYjE0NWZmYzJhYWIxZWZhMWFmM2MyZWYzNDp7ImF1dGgtdG9rZW4iOiJiODBkMWM4ZGZmZWE2NmNhNTg0NmYxM2ZlMmU4YTVmMTgwODVjYmJmIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJiYXNlLmJhY2tlbmRzLkF1dGhCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTFmMzM1NjdhNDk2NDFhNWM2NDAzZGM5MWRhM2NmNzYxYzMxYjcwZCJ9	2020-02-03 10:59:27.811161-08
\.


--
-- Data for Name: mixnet_mixnet; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.mixnet_mixnet (id, voting_id, key_id, pubkey_id, auth_position) FROM stdin;
1	1	1	\N	0
2	1	2	\N	0
3	2	3	4	0
4	3	6	\N	0
5	3	7	\N	0
6	3	8	9	0
\.


--
-- Data for Name: mixnet_mixnet_auths; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.mixnet_mixnet_auths (id, mixnet_id, auth_id) FROM stdin;
1	1	1
2	1	2
3	2	1
4	2	2
6	4	2
7	4	1
8	5	2
9	5	1
10	6	1
\.


--
-- Data for Name: store_backup; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.store_backup (id) FROM stdin;
\.


--
-- Data for Name: store_vote; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.store_vote (id, voting_id, voter_id, a, b, voted) FROM stdin;
1	3	1	43276486549896162877982525698847589064612063253874496914000449917910590157389	82562300721092075802263717531689514489379447994836044192920883178309971812005	2019-11-18 08:19:41.830826-08
\.


--
-- Data for Name: voting_question; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.voting_question (id, "desc") FROM stdin;
1	¿Qué tamaño de la sala prefieres?
2	¿Qué color de las mesas prefieres?
3	¿Prueba?
\.


--
-- Data for Name: voting_questionoption; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.voting_questionoption (id, number, option, question_id) FROM stdin;
1	1	Pequeña	1
2	2	Mediana	1
3	3	Grande	1
4	1	Rojo	2
5	2	Verde	2
6	3	Azul	2
7	1	Sí	3
8	2	No	3
\.


--
-- Data for Name: voting_voting; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.voting_voting (id, name, "desc", start_date, end_date, pub_key_id, question_id, postproc, tally) FROM stdin;
1	Tamaño de la sala	Votar el tamaño de la sala	\N	2019-10-21 10:24:06.046653-07	\N	1	\N	\N
2	Color de las mesas	Decidir color de las mesas	2019-10-21 11:16:55.734429-07	\N	5	2	\N	\N
3	Prueba	Prueba	2019-11-18 08:17:22.617366-08	\N	10	3	\N	\N
\.


--
-- Data for Name: voting_voting_auths; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.voting_voting_auths (id, voting_id, auth_id) FROM stdin;
2	1	2
4	2	2
6	2	1
7	3	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 60, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 73, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 4, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 80, true);


--
-- Name: background_task_completedtask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.background_task_completedtask_id_seq', 1, false);


--
-- Name: background_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.background_task_id_seq', 1, false);


--
-- Name: base_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.base_auth_id_seq', 3, true);


--
-- Name: base_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.base_key_id_seq', 10, true);


--
-- Name: census_census_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.census_census_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 68, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 19, true);


--
-- Name: django_cron_cronjoblog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.django_cron_cronjoblog_id_seq', 195, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 42, true);


--
-- Name: mixnet_mixnet_auths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.mixnet_mixnet_auths_id_seq', 10, true);


--
-- Name: mixnet_mixnet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.mixnet_mixnet_id_seq', 6, true);


--
-- Name: store_backup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.store_backup_id_seq', 22, true);


--
-- Name: store_vote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.store_vote_id_seq', 1, true);


--
-- Name: voting_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.voting_question_id_seq', 3, true);


--
-- Name: voting_questionoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.voting_questionoption_id_seq', 8, true);


--
-- Name: voting_voting_auths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.voting_voting_auths_id_seq', 8, true);


--
-- Name: voting_voting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.voting_voting_id_seq', 3, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: background_task_completedtask background_task_completedtask_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.background_task_completedtask
    ADD CONSTRAINT background_task_completedtask_pkey PRIMARY KEY (id);


--
-- Name: background_task background_task_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.background_task
    ADD CONSTRAINT background_task_pkey PRIMARY KEY (id);


--
-- Name: base_auth base_auth_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.base_auth
    ADD CONSTRAINT base_auth_pkey PRIMARY KEY (id);


--
-- Name: base_key base_key_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.base_key
    ADD CONSTRAINT base_key_pkey PRIMARY KEY (id);


--
-- Name: census_census census_census_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.census_census
    ADD CONSTRAINT census_census_pkey PRIMARY KEY (id);


--
-- Name: census_census census_census_voting_id_voter_id_d06a5c5b_uniq; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.census_census
    ADD CONSTRAINT census_census_voting_id_voter_id_d06a5c5b_uniq UNIQUE (voting_id, voter_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_cron_cronjoblog django_cron_cronjoblog_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_cron_cronjoblog
    ADD CONSTRAINT django_cron_cronjoblog_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: mixnet_mixnet_auths mixnet_mixnet_auths_mixnet_id_auth_id_f0748f49_uniq; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.mixnet_mixnet_auths
    ADD CONSTRAINT mixnet_mixnet_auths_mixnet_id_auth_id_f0748f49_uniq UNIQUE (mixnet_id, auth_id);


--
-- Name: mixnet_mixnet_auths mixnet_mixnet_auths_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.mixnet_mixnet_auths
    ADD CONSTRAINT mixnet_mixnet_auths_pkey PRIMARY KEY (id);


--
-- Name: mixnet_mixnet mixnet_mixnet_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.mixnet_mixnet
    ADD CONSTRAINT mixnet_mixnet_pkey PRIMARY KEY (id);


--
-- Name: store_backup store_backup_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.store_backup
    ADD CONSTRAINT store_backup_pkey PRIMARY KEY (id);


--
-- Name: store_vote store_vote_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.store_vote
    ADD CONSTRAINT store_vote_pkey PRIMARY KEY (id);


--
-- Name: voting_question voting_question_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_question
    ADD CONSTRAINT voting_question_pkey PRIMARY KEY (id);


--
-- Name: voting_questionoption voting_questionoption_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_questionoption
    ADD CONSTRAINT voting_questionoption_pkey PRIMARY KEY (id);


--
-- Name: voting_voting_auths voting_voting_auths_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_voting_auths
    ADD CONSTRAINT voting_voting_auths_pkey PRIMARY KEY (id);


--
-- Name: voting_voting_auths voting_voting_auths_voting_id_auth_id_73b2c117_uniq; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_voting_auths
    ADD CONSTRAINT voting_voting_auths_voting_id_auth_id_73b2c117_uniq UNIQUE (voting_id, auth_id);


--
-- Name: voting_voting voting_voting_pkey; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_voting
    ADD CONSTRAINT voting_voting_pkey PRIMARY KEY (id);


--
-- Name: voting_voting voting_voting_pub_key_id_key; Type: CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_voting
    ADD CONSTRAINT voting_voting_pub_key_id_key UNIQUE (pub_key_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: background_task_attempts_a9ade23d; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_attempts_a9ade23d ON public.background_task USING btree (attempts);


--
-- Name: background_task_completedtask_attempts_772a6783; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_attempts_772a6783 ON public.background_task_completedtask USING btree (attempts);


--
-- Name: background_task_completedtask_creator_content_type_id_21d6a741; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_creator_content_type_id_21d6a741 ON public.background_task_completedtask USING btree (creator_content_type_id);


--
-- Name: background_task_completedtask_failed_at_3de56618; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_failed_at_3de56618 ON public.background_task_completedtask USING btree (failed_at);


--
-- Name: background_task_completedtask_locked_at_29c62708; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_locked_at_29c62708 ON public.background_task_completedtask USING btree (locked_at);


--
-- Name: background_task_completedtask_locked_by_edc8a213; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_locked_by_edc8a213 ON public.background_task_completedtask USING btree (locked_by);


--
-- Name: background_task_completedtask_locked_by_edc8a213_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_locked_by_edc8a213_like ON public.background_task_completedtask USING btree (locked_by varchar_pattern_ops);


--
-- Name: background_task_completedtask_priority_9080692e; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_priority_9080692e ON public.background_task_completedtask USING btree (priority);


--
-- Name: background_task_completedtask_queue_61fb0415; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_queue_61fb0415 ON public.background_task_completedtask USING btree (queue);


--
-- Name: background_task_completedtask_queue_61fb0415_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_queue_61fb0415_like ON public.background_task_completedtask USING btree (queue varchar_pattern_ops);


--
-- Name: background_task_completedtask_run_at_77c80f34; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_run_at_77c80f34 ON public.background_task_completedtask USING btree (run_at);


--
-- Name: background_task_completedtask_task_hash_91187576; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_task_hash_91187576 ON public.background_task_completedtask USING btree (task_hash);


--
-- Name: background_task_completedtask_task_hash_91187576_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_task_hash_91187576_like ON public.background_task_completedtask USING btree (task_hash varchar_pattern_ops);


--
-- Name: background_task_completedtask_task_name_388dabc2; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_task_name_388dabc2 ON public.background_task_completedtask USING btree (task_name);


--
-- Name: background_task_completedtask_task_name_388dabc2_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_completedtask_task_name_388dabc2_like ON public.background_task_completedtask USING btree (task_name varchar_pattern_ops);


--
-- Name: background_task_creator_content_type_id_61cc9af3; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_creator_content_type_id_61cc9af3 ON public.background_task USING btree (creator_content_type_id);


--
-- Name: background_task_failed_at_b81bba14; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_failed_at_b81bba14 ON public.background_task USING btree (failed_at);


--
-- Name: background_task_locked_at_0fb0f225; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_locked_at_0fb0f225 ON public.background_task USING btree (locked_at);


--
-- Name: background_task_locked_by_db7779e3; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_locked_by_db7779e3 ON public.background_task USING btree (locked_by);


--
-- Name: background_task_locked_by_db7779e3_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_locked_by_db7779e3_like ON public.background_task USING btree (locked_by varchar_pattern_ops);


--
-- Name: background_task_priority_88bdbce9; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_priority_88bdbce9 ON public.background_task USING btree (priority);


--
-- Name: background_task_queue_1d5f3a40; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_queue_1d5f3a40 ON public.background_task USING btree (queue);


--
-- Name: background_task_queue_1d5f3a40_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_queue_1d5f3a40_like ON public.background_task USING btree (queue varchar_pattern_ops);


--
-- Name: background_task_run_at_7baca3aa; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_run_at_7baca3aa ON public.background_task USING btree (run_at);


--
-- Name: background_task_task_hash_d8f233bd; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_task_hash_d8f233bd ON public.background_task USING btree (task_hash);


--
-- Name: background_task_task_hash_d8f233bd_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_task_hash_d8f233bd_like ON public.background_task USING btree (task_hash varchar_pattern_ops);


--
-- Name: background_task_task_name_4562d56a; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_task_name_4562d56a ON public.background_task USING btree (task_name);


--
-- Name: background_task_task_name_4562d56a_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX background_task_task_name_4562d56a_like ON public.background_task USING btree (task_name varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_cron_cronjoblog_code_48865653; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_cron_cronjoblog_code_48865653 ON public.django_cron_cronjoblog USING btree (code);


--
-- Name: django_cron_cronjoblog_code_48865653_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_cron_cronjoblog_code_48865653_like ON public.django_cron_cronjoblog USING btree (code varchar_pattern_ops);


--
-- Name: django_cron_cronjoblog_code_is_success_ran_at_time_84da9606_idx; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_cron_cronjoblog_code_is_success_ran_at_time_84da9606_idx ON public.django_cron_cronjoblog USING btree (code, is_success, ran_at_time);


--
-- Name: django_cron_cronjoblog_code_start_time_4fc78f9d_idx; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_cron_cronjoblog_code_start_time_4fc78f9d_idx ON public.django_cron_cronjoblog USING btree (code, start_time);


--
-- Name: django_cron_cronjoblog_code_start_time_ran_at_time_8b50b8fa_idx; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_cron_cronjoblog_code_start_time_ran_at_time_8b50b8fa_idx ON public.django_cron_cronjoblog USING btree (code, start_time, ran_at_time);


--
-- Name: django_cron_cronjoblog_end_time_7918602a; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_cron_cronjoblog_end_time_7918602a ON public.django_cron_cronjoblog USING btree (end_time);


--
-- Name: django_cron_cronjoblog_ran_at_time_7fed2751; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_cron_cronjoblog_ran_at_time_7fed2751 ON public.django_cron_cronjoblog USING btree (ran_at_time);


--
-- Name: django_cron_cronjoblog_start_time_d68c0dd9; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_cron_cronjoblog_start_time_d68c0dd9 ON public.django_cron_cronjoblog USING btree (start_time);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: mixnet_mixnet_auths_auth_id_247a47a8; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX mixnet_mixnet_auths_auth_id_247a47a8 ON public.mixnet_mixnet_auths USING btree (auth_id);


--
-- Name: mixnet_mixnet_auths_mixnet_id_17d16753; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX mixnet_mixnet_auths_mixnet_id_17d16753 ON public.mixnet_mixnet_auths USING btree (mixnet_id);


--
-- Name: mixnet_mixnet_key_id_9e26aa36; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX mixnet_mixnet_key_id_9e26aa36 ON public.mixnet_mixnet USING btree (key_id);


--
-- Name: mixnet_mixnet_pubkey_id_bd539c04; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX mixnet_mixnet_pubkey_id_bd539c04 ON public.mixnet_mixnet USING btree (pubkey_id);


--
-- Name: voting_questionoption_question_id_19a4bcc8; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX voting_questionoption_question_id_19a4bcc8 ON public.voting_questionoption USING btree (question_id);


--
-- Name: voting_voting_auths_auth_id_ca0d0b4c; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX voting_voting_auths_auth_id_ca0d0b4c ON public.voting_voting_auths USING btree (auth_id);


--
-- Name: voting_voting_auths_voting_id_7d549c6f; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX voting_voting_auths_voting_id_7d549c6f ON public.voting_voting_auths USING btree (voting_id);


--
-- Name: voting_voting_question_id_9e97fbf8; Type: INDEX; Schema: public; Owner: decide
--

CREATE INDEX voting_voting_question_id_9e97fbf8 ON public.voting_voting USING btree (question_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: background_task_completedtask background_task_comp_creator_content_type_21d6a741_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.background_task_completedtask
    ADD CONSTRAINT background_task_comp_creator_content_type_21d6a741_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: background_task background_task_creator_content_type_61cc9af3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.background_task
    ADD CONSTRAINT background_task_creator_content_type_61cc9af3_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mixnet_mixnet_auths mixnet_mixnet_auths_mixnet_id_17d16753_fk_mixnet_mixnet_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.mixnet_mixnet_auths
    ADD CONSTRAINT mixnet_mixnet_auths_mixnet_id_17d16753_fk_mixnet_mixnet_id FOREIGN KEY (mixnet_id) REFERENCES public.mixnet_mixnet(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mixnet_mixnet mixnet_mixnet_key_id_9e26aa36_fk_base_key_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.mixnet_mixnet
    ADD CONSTRAINT mixnet_mixnet_key_id_9e26aa36_fk_base_key_id FOREIGN KEY (key_id) REFERENCES public.base_key(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: mixnet_mixnet mixnet_mixnet_pubkey_id_bd539c04_fk_base_key_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.mixnet_mixnet
    ADD CONSTRAINT mixnet_mixnet_pubkey_id_bd539c04_fk_base_key_id FOREIGN KEY (pubkey_id) REFERENCES public.base_key(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voting_questionoption voting_questionoptio_question_id_19a4bcc8_fk_voting_qu; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_questionoption
    ADD CONSTRAINT voting_questionoptio_question_id_19a4bcc8_fk_voting_qu FOREIGN KEY (question_id) REFERENCES public.voting_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voting_voting_auths voting_voting_auths_auth_id_ca0d0b4c_fk_base_auth_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_voting_auths
    ADD CONSTRAINT voting_voting_auths_auth_id_ca0d0b4c_fk_base_auth_id FOREIGN KEY (auth_id) REFERENCES public.base_auth(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voting_voting_auths voting_voting_auths_voting_id_7d549c6f_fk_voting_voting_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_voting_auths
    ADD CONSTRAINT voting_voting_auths_voting_id_7d549c6f_fk_voting_voting_id FOREIGN KEY (voting_id) REFERENCES public.voting_voting(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voting_voting voting_voting_pub_key_id_1ae022f2_fk_base_key_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_voting
    ADD CONSTRAINT voting_voting_pub_key_id_1ae022f2_fk_base_key_id FOREIGN KEY (pub_key_id) REFERENCES public.base_key(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: voting_voting voting_voting_question_id_9e97fbf8_fk_voting_question_id; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.voting_voting
    ADD CONSTRAINT voting_voting_question_id_9e97fbf8_fk_voting_question_id FOREIGN KEY (question_id) REFERENCES public.voting_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

