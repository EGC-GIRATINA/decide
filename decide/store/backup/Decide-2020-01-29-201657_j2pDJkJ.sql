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
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk;
ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
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
ALTER TABLE public.mixnet_mixnet_auths ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.mixnet_mixnet ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_cron_cronjoblog ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.census_census ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.base_key ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.base_auth ALTER COLUMN id DROP DEFAULT;
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
-- Name: store_vote; Type: TABLE; Schema: public; Owner: decide
--

CREATE TABLE public.store_vote (
    id integer NOT NULL,
    voting_id integer NOT NULL,
    voter_id integer NOT NULL,
    a text NOT NULL,
    b text NOT NULL,
    voted timestamp with time zone NOT NULL,
    voter_age integer NOT NULL,
    voter_city text NOT NULL,
    voter_ip inet NOT NULL,
    voter_sex text NOT NULL,
    CONSTRAINT store_vote_voter_age_check CHECK ((voter_age >= 0)),
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
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add cron job log	7	add_cronjoblog
20	Can change cron job log	7	change_cronjoblog
21	Can delete cron job log	7	delete_cronjoblog
22	Can add Token	8	add_token
23	Can change Token	8	change_token
24	Can delete Token	8	delete_token
25	Can add auth	9	add_auth
26	Can change auth	9	change_auth
27	Can delete auth	9	delete_auth
28	Can add key	10	add_key
29	Can change key	10	change_key
30	Can delete key	10	delete_key
31	Can add census	11	add_census
32	Can change census	11	change_census
33	Can delete census	11	delete_census
34	Can add mixnet	12	add_mixnet
35	Can change mixnet	12	change_mixnet
36	Can delete mixnet	12	delete_mixnet
37	Can add vote	13	add_vote
38	Can change vote	13	change_vote
39	Can delete vote	13	delete_vote
40	Can add question	14	add_question
41	Can change question	14	change_question
42	Can delete question	14	delete_question
43	Can add question option	15	add_questionoption
44	Can change question option	15	change_questionoption
45	Can delete question option	15	delete_questionoption
46	Can add voting	16	add_voting
47	Can change voting	16	change_voting
48	Can delete voting	16	delete_voting
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
2	pbkdf2_sha256$100000$CCCazxTbD09A$Yt6ODY5hBhuM0CR/Ujh41NEbcpgq9jlLA17ISV3XFuU=	\N	f	Riokaru				f	t	2020-01-29 12:11:33.741894-08
1	pbkdf2_sha256$100000$YZiiThnISQrg$U2Ck+YABwP2vmOFJ5Hw6SK/+RaPueAy2sHb0D8OYaAc=	2020-01-29 12:12:57.804228-08	t	decide			decide@decide.es	t	t	2020-01-29 12:07:25.753229-08
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: base_auth; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.base_auth (id, name, url, me) FROM stdin;
1	localhost	http://localhost:8000	f
\.


--
-- Data for Name: base_key; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.base_key (id, p, g, y, x) FROM stdin;
1	1454148355435556691518676974370014622641831948409330902761418938295888856438226361644503466043	965847014531057310742280409055406495182619470873695576860051115945224187161548954355345879538	1305167813822321465772815051426700676342199155415154522905165343933823032552888641851472453366	421479571834805558094196515697800920499276184269381599141185791875962225048592155889947512011
2	1454148355435556691518676974370014622641831948409330902761418938295888856438226361644503466043	965847014531057310742280409055406495182619470873695576860051115945224187161548954355345879538	1305167813822321465772815051426700676342199155415154522905165343933823032552888641851472453366	0
3	1454148355435556691518676974370014622641831948409330902761418938295888856438226361644503466043	965847014531057310742280409055406495182619470873695576860051115945224187161548954355345879538	1305167813822321465772815051426700676342199155415154522905165343933823032552888641851472453366	0
\.


--
-- Data for Name: census_census; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.census_census (id, voting_id, voter_id) FROM stdin;
1	1	2
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-01-29 12:09:39.414121-08	1	¿Qué es lo que más te gusta?	1	[{"added": {}}, {"added": {"name": "question option", "object": "Comer (1)"}}, {"added": {"name": "question option", "object": "Dormir (2)"}}, {"added": {"name": "question option", "object": "Aprobar (3)"}}]	14	1
2	2020-01-29 12:10:28.690505-08	1	http://localhost:8000	1	[{"added": {}}]	9	1
3	2020-01-29 12:10:46.943758-08	1	Voto 1	1	[{"added": {}}]	16	1
4	2020-01-29 12:11:33.793755-08	2	Riokaru	1	[{"added": {}}]	4	1
5	2020-01-29 12:11:52.791907-08	1	Census object (1)	1	[{"added": {}}]	11	1
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
7	django_cron	cronjoblog
8	authtoken	token
9	base	auth
10	base	key
11	census	census
12	mixnet	mixnet
13	store	vote
14	voting	question
15	voting	questionoption
16	voting	voting
\.


--
-- Data for Name: django_cron_cronjoblog; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.django_cron_cronjoblog (id, code, start_time, end_time, is_success, message, ran_at_time) FROM stdin;
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-01-29 12:05:50.920447-08
2	auth	0001_initial	2020-01-29 12:05:50.976219-08
3	admin	0001_initial	2020-01-29 12:05:50.995187-08
4	admin	0002_logentry_remove_auto_add	2020-01-29 12:05:51.001639-08
5	contenttypes	0002_remove_content_type_name	2020-01-29 12:05:51.017421-08
6	auth	0002_alter_permission_name_max_length	2020-01-29 12:05:51.022903-08
7	auth	0003_alter_user_email_max_length	2020-01-29 12:05:51.0305-08
8	auth	0004_alter_user_username_opts	2020-01-29 12:05:51.037476-08
9	auth	0005_alter_user_last_login_null	2020-01-29 12:05:51.047249-08
10	auth	0006_require_contenttypes_0002	2020-01-29 12:05:51.048995-08
11	auth	0007_alter_validators_add_error_messages	2020-01-29 12:05:51.055435-08
12	auth	0008_alter_user_username_max_length	2020-01-29 12:05:51.072228-08
13	auth	0009_alter_user_last_name_max_length	2020-01-29 12:05:51.080103-08
14	authtoken	0001_initial	2020-01-29 12:05:51.094159-08
15	authtoken	0002_auto_20160226_1747	2020-01-29 12:05:51.123024-08
16	base	0001_initial	2020-01-29 12:05:51.133266-08
17	base	0002_auto_20180921_1056	2020-01-29 12:05:51.147703-08
18	base	0003_auto_20180921_1119	2020-01-29 12:05:51.17212-08
19	census	0001_initial	2020-01-29 12:05:51.181722-08
20	django_cron	0001_initial	2020-01-29 12:05:51.202404-08
21	django_cron	0002_remove_max_length_from_CronJobLog_message	2020-01-29 12:05:51.205343-08
22	mixnet	0001_initial	2020-01-29 12:05:51.23269-08
23	mixnet	0002_auto_20180216_1617	2020-01-29 12:05:51.241364-08
24	voting	0001_initial	2020-01-29 12:05:51.280827-08
25	voting	0002_auto_20180302_1100	2020-01-29 12:05:51.296013-08
26	voting	0003_auto_20180605_0842	2020-01-29 12:05:51.323688-08
27	mixnet	0003_mixnet_auth_position	2020-01-29 12:05:51.334732-08
28	mixnet	0004_auto_20180605_0842	2020-01-29 12:05:51.372953-08
29	sessions	0001_initial	2020-01-29 12:05:51.384967-08
30	store	0001_initial	2020-01-29 12:05:51.391021-08
31	store	0002_vote_voted	2020-01-29 12:05:51.399282-08
32	store	0003_auto_20180921_1522	2020-01-29 12:05:51.422619-08
33	store	0004_backup	2020-01-29 12:05:51.431381-08
34	store	0005_auto_20200121_2203	2020-01-29 12:05:51.470688-08
35	store	0006_auto_20200124_1756	2020-01-29 12:05:51.476649-08
36	store	0007_delete_backup	2020-01-29 12:05:51.481239-08
37	store	0004_auto_20200110_1011	2020-01-29 12:05:51.486239-08
38	store	0005_auto_20200110_1013	2020-01-29 12:05:51.516228-08
39	store	0008_merge_20200127_2136	2020-01-29 12:05:51.517984-08
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
qt48jwjsxbsd87stip897ods1tg9n5yv	NjU0NjcyMmQxZjU1MDc0ZGNmMWM4NGNlZDlmODM0ZmYyNDE3MmY5Zjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiYmFzZS5iYWNrZW5kcy5BdXRoQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6Ijg3YmJkMTlmZjg2MTlmNDY3NGZmZDM5NjNiZjY3ZDgwMjJjYjMwNDUifQ==	2020-02-12 12:12:57.806453-08
\.


--
-- Data for Name: mixnet_mixnet; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.mixnet_mixnet (id, voting_id, key_id, pubkey_id, auth_position) FROM stdin;
1	1	1	2	0
\.


--
-- Data for Name: mixnet_mixnet_auths; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.mixnet_mixnet_auths (id, mixnet_id, auth_id) FROM stdin;
1	1	1
\.


--
-- Data for Name: store_vote; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.store_vote (id, voting_id, voter_id, a, b, voted, voter_age, voter_city, voter_ip, voter_sex) FROM stdin;
\.


--
-- Data for Name: voting_question; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.voting_question (id, "desc") FROM stdin;
1	¿Qué es lo que más te gusta?
\.


--
-- Data for Name: voting_questionoption; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.voting_questionoption (id, number, option, question_id) FROM stdin;
1	1	Comer	1
2	2	Dormir	1
3	3	Aprobar	1
\.


--
-- Data for Name: voting_voting; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.voting_voting (id, name, "desc", start_date, end_date, pub_key_id, question_id, postproc, tally) FROM stdin;
1	Voto 1	Primer voto	2020-01-29 12:11:02.387163-08	\N	3	1	\N	\N
\.


--
-- Data for Name: voting_voting_auths; Type: TABLE DATA; Schema: public; Owner: decide
--

COPY public.voting_voting_auths (id, voting_id, auth_id) FROM stdin;
1	1	1
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 2, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: base_auth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.base_auth_id_seq', 1, true);


--
-- Name: base_key_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.base_key_id_seq', 3, true);


--
-- Name: census_census_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.census_census_id_seq', 1, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 5, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 16, true);


--
-- Name: django_cron_cronjoblog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.django_cron_cronjoblog_id_seq', 1, false);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 39, true);


--
-- Name: mixnet_mixnet_auths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.mixnet_mixnet_auths_id_seq', 1, true);


--
-- Name: mixnet_mixnet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.mixnet_mixnet_id_seq', 1, true);


--
-- Name: store_vote_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.store_vote_id_seq', 1, false);


--
-- Name: voting_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.voting_question_id_seq', 1, true);


--
-- Name: voting_questionoption_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.voting_questionoption_id_seq', 3, true);


--
-- Name: voting_voting_auths_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.voting_voting_auths_id_seq', 1, true);


--
-- Name: voting_voting_id_seq; Type: SEQUENCE SET; Schema: public; Owner: decide
--

SELECT pg_catalog.setval('public.voting_voting_id_seq', 1, true);


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
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: decide
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


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

