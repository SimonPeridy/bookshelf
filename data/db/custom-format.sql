PGDMP
         "                z         	   bookshelf    11.7    11.7 â    ¢           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ¥           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ┐           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            └           1262    33662 	   bookshelf    DATABASE     ë   CREATE DATABASE bookshelf WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE bookshelf;
             postgres    false            ─            1259    33663 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false            ┼            1259    33666    auth_group_id_seq    SEQUENCE     ë   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    196            ┴           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    197            ã            1259    33668    auth_group_permissions    TABLE     è   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false            Ã            1259    33671    auth_group_permissions_id_seq    SEQUENCE     å   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    198            ┬           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    199            ╚            1259    33673    auth_permission    TABLE     ┐   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false            ╔            1259    33676    auth_permission_id_seq    SEQUENCE     Ä   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    200            ├           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    201            ╩            1259    33678 	   auth_user    TABLE     ▀  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         postgres    false            ╦            1259    33684    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false            ╠            1259    33687    auth_user_groups_id_seq    SEQUENCE     Ç   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    203            ─           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       postgres    false    204            ═            1259    33689    auth_user_id_seq    SEQUENCE     ê   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    202            ┼           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       postgres    false    205            ╬            1259    33691    auth_user_user_permissions    TABLE     ì   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false            ¤            1259    33694 !   auth_user_user_permissions_id_seq    SEQUENCE     è   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    206            ã           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       postgres    false    207            ð            1259    33696    author    TABLE     ï   CREATE TABLE public.author (
    id integer NOT NULL,
    firstname character varying NOT NULL,
    lastname character varying NOT NULL
);
    DROP TABLE public.author;
       public         postgres    false            Ð            1259    33702 
   author_id_seq    SEQUENCE     v   CREATE SEQUENCE public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.author_id_seq;
       public       postgres    false    208            Ã           0    0 
   author_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;
            public       postgres    false    209            Ê            1259    33704    base    TABLE     è   CREATE TABLE public.base (
    owner_id integer,
    author_id integer NOT NULL,
    book_id integer NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.base;
       public         postgres    false            Ë            1259    33707    base_id_seq    SEQUENCE     â   CREATE SEQUENCE public.base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.base_id_seq;
       public       postgres    false    210            ╚           0    0    base_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.base_id_seq OWNED BY public.base.id;
            public       postgres    false    211            È            1259    33709    book    TABLE     X  CREATE TABLE public.book (
    title character varying NOT NULL,
    id integer NOT NULL,
    format integer DEFAULT '-1'::integer,
    mark integer DEFAULT '-1'::integer,
    type integer,
    date_end_reading date,
    series character varying,
    language character varying DEFAULT 'french'::character varying,
    series_number integer
);
    DROP TABLE public.book;
       public         postgres    false            ı            1259    33718    book_id_seq    SEQUENCE     â   CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.book_id_seq;
       public       postgres    false    212            ╔           0    0    book_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;
            public       postgres    false    213            Í            1259    33720    django_admin_log    TABLE     ê  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         postgres    false            Î            1259    33727    django_admin_log_id_seq    SEQUENCE     Å   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    214            ╩           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    215            Ï            1259    33729    django_content_type    TABLE     ƒ   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false            ┘            1259    33732    django_content_type_id_seq    SEQUENCE     Æ   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    216            ╦           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    217            ┌            1259    33734    django_migrations    TABLE     ─   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false            █            1259    33740    django_migrations_id_seq    SEQUENCE     ü   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    218            ╠           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    219            ▄            1259    33742    django_session    TABLE     ¬   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false            ¦            1259    33748    owner_id_seq    SEQUENCE     u   CREATE SEQUENCE public.owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.owner_id_seq;
       public       postgres    false            Ì            1259    33750    owner    TABLE     ì   CREATE TABLE public.owner (
    id integer DEFAULT nextval('public.owner_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.owner;
       public         postgres    false    221            ð
           2604    33757 
   auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            Ð
           2604    33758    auth_group_permissions id    DEFAULT     å   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            Ê
           2604    33759    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            Ë
           2604    33760    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    202            È
           2604    33761    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            ı
           2604    33762    auth_user_user_permissions id    DEFAULT     Ä   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            Í
           2604    33763 	   author id    DEFAULT     f   ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);
 8   ALTER TABLE public.author ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            Î
           2604    33764    base id    DEFAULT     b   ALTER TABLE ONLY public.base ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);
 6   ALTER TABLE public.base ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            █
           2604    33765    book id    DEFAULT     b   ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);
 6   ALTER TABLE public.book ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212            ▄
           2604    33766    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            Ì
           2604    33767    django_content_type id    DEFAULT     Ç   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            ▀
           2604    33768    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218            á          0    33663 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    196            ó          0    33668    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    198            ñ          0    33673    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    200            ª          0    33678 	   auth_user 
   TABLE DATA               ò   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    202            º          0    33684    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    203            ¬          0    33691    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    206            ¼          0    33696    author 
   TABLE DATA               9   COPY public.author (id, firstname, lastname) FROM stdin;
    public       postgres    false    208            «          0    33704    base 
   TABLE DATA               @   COPY public.base (owner_id, author_id, book_id, id) FROM stdin;
    public       postgres    false    210            ░          0    33709    book 
   TABLE DATA               p   COPY public.book (title, id, format, mark, type, date_end_reading, series, language, series_number) FROM stdin;
    public       postgres    false    212            ▓          0    33720    django_admin_log 
   TABLE DATA               è   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    214            ┤          0    33729    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    216            Â          0    33734    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    218            ©          0    33742    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    220            ║          0    33750    owner 
   TABLE DATA               )   COPY public.owner (id, name) FROM stdin;
    public       postgres    false    222            ═           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    197            ╬           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    199            ¤           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 1, false);
            public       postgres    false    201            ð           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       postgres    false    204            Ð           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);
            public       postgres    false    205            Ê           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    207            Ë           0    0 
   author_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.author_id_seq', 1, false);
            public       postgres    false    209            È           0    0    base_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.base_id_seq', 1, false);
            public       postgres    false    211            ı           0    0    book_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.book_id_seq', 1, false);
            public       postgres    false    213            Í           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
            public       postgres    false    215            Î           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 1, false);
            public       postgres    false    217            Ï           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 1, false);
            public       postgres    false    219            ┘           0    0    owner_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.owner_id_seq', 1, false);
            public       postgres    false    221            Ò
           2606    33772    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    196            Þ
           2606    33774 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     á   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    198    198            Ù
           2606    33776 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    198            Õ
           2606    33778    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    196            ¯
           2606    33780 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     û   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    200    200            ­
           2606    33782 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    200            °
           2606    33784 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    203            ¹
           2606    33786 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     ê   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    203    203            ‗
           2606    33788    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    202            ■
           2606    33790 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    206                       2606    33792 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     ª   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 â   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    206    206            §
           2606    33794     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    202                       2606    33796    author author_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pk;
       public         postgres    false    208                       2606    33798    base base_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.base DROP CONSTRAINT base_pkey;
       public         postgres    false    210            	           2606    33800    book book_pk 
   CONSTRAINT     J   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pk;
       public         postgres    false    212                       2606    33802 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    214                       2606    33804 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     î   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    216    216                       2606    33806 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    216                       2606    33808 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    218                       2606    33810 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    220                       2606    33812 
   owner o_pk 
   CONSTRAINT     H   ALTER TABLE ONLY public.owner
    ADD CONSTRAINT o_pk PRIMARY KEY (id);
 4   ALTER TABLE ONLY public.owner DROP CONSTRAINT o_pk;
       public         postgres    false    222            ß
           1259    33813    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    196            µ
           1259    33814 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    198            Ú
           1259    33815 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    198            ý
           1259    33816 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    200            ÷
           1259    33817 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    203            ¨
           1259    33818 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    203            ³
           1259    33819 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     ü   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    206             
           1259    33820 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    206            ¾
           1259    33821     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    202                       1259    33822    author_id_uindex    INDEX     H   CREATE UNIQUE INDEX author_id_uindex ON public.author USING btree (id);
 $   DROP INDEX public.author_id_uindex;
       public         postgres    false    208                       1259    33823    book_id_uindex    INDEX     D   CREATE UNIQUE INDEX book_id_uindex ON public.book USING btree (id);
 "   DROP INDEX public.book_id_uindex;
       public         postgres    false    212            
           1259    33824 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    214            
           1259    33825 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    214                       1259    33826 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    220                       1259    33827 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    220                       1259    33828    owner_name_uindex    INDEX     J   CREATE UNIQUE INDEX owner_name_uindex ON public.owner USING btree (name);
 %   DROP INDEX public.owner_name_uindex;
       public         postgres    false    222                       2606    33829 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm 
   FK CONSTRAINT     ▄   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    200    198    2800                       2606    33834 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id 
   FK CONSTRAINT     Ë   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    196    198    2789                       2606    33839 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co 
   FK CONSTRAINT     Ï   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    200    2833    216                       2606    33844 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id 
   FK CONSTRAINT     Ã   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    2789    196    203                       2606    33849 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id 
   FK CONSTRAINT     ├   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    202    2802    203                        2606    33854 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm 
   FK CONSTRAINT     Ó   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    200    206    2800            !           2606    33859 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id 
   FK CONSTRAINT     Î   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 Ç   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    206    202    2802            "           2606    33864    base base_author_id_fk 
   FK CONSTRAINT     x   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_author_id_fk FOREIGN KEY (author_id) REFERENCES public.author(id);
 @   ALTER TABLE ONLY public.base DROP CONSTRAINT base_author_id_fk;
       public       postgres    false    208    2820    210            #           2606    33869    base base_book_id_fk 
   FK CONSTRAINT     r   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_book_id_fk FOREIGN KEY (book_id) REFERENCES public.book(id);
 >   ALTER TABLE ONLY public.base DROP CONSTRAINT base_book_id_fk;
       public       postgres    false    2825    210    212            $           2606    33874    base base_owner_id_fk 
   FK CONSTRAINT     u   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.owner(id);
 ?   ALTER TABLE ONLY public.base DROP CONSTRAINT base_owner_id_fk;
       public       postgres    false    210    222    2841            %           2606    33879 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co 
   FK CONSTRAINT     ┌   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    214    2833    216            &           2606    33884 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id 
   FK CONSTRAINT     ├   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    214    202    2802            á   
   x£ïÐÒÔÔ ┼ ®      ó   
   x£ïÐÒÔÔ ┼ ®      ñ   ┼  x£UöYn┬0@┐ÝSpé
'a¹¯5*U,ê┌ã4KÀo2¹³y<O‗<%à¸Â▀┤ÎÙµw╬ÒÈò>ñ░îƒ<ã
ê╦¢Ýo┘Bxú\
▄5þ╔qxú\▄_ùƒûZgevbu╣ù¯ÆCN8─¢5Ç|ê9Xa╚àÿúÜ┤?ë┼w╣mr?
»Pâ╚2├ËÍ║XîtöLÍ╚Æ$ÑdÑ^û5Ñj▒{õßºÃ§çl@O/bj¼á#╔ð┬;ÙÞ`Æ┤­^5
×<êÚm(¾#ý@╬1¡´IìÉôÁbää®ÂÛ┬ hð:ë┴<µ!ýA`=ã╩ÕM[zÎ5¶8&hZ├Ë©4%ù~Z■║═¶zõp└×±j¢ëò»┌├▄ÂÕ}ß×þ╬-ok¸46oY-╠°ÀAÿªX╗ýò!O┴\¾èæ×`&xà└J¡¢Øº{┬	äpêÁ½\Êa╚ı-╔0d¬TðÜ¤Ýÿ├‗XEÍs¼]╠╝&$\╦LÉìIÖ¸­>nÁõs)_!ßÃz=ÃãÑ╠k~Î2³:&fÌÒÙ░ıÜ╦│_RO°]å!6«`HÇW¡0ñ@î)UÉ└²Ã[î±VX;╗      ª   
   x£ïÐÒÔÔ ┼ ®      º   
   x£ïÐÒÔÔ ┼ ®      ¬   
   x£ïÐÒÔÔ ┼ ®      ¼   Þ  x£eT┴R█H=wào{é┬Æ,█G0ãlCòTÂ÷ÊÂkbiå╠î ­E╔}kk´■▒}úä¦├û/×ÖV¸ÙÎ´§xB¸╬~:Îµ═┘]ú|B7ìy6ÛÚ┴w[ÊòiÚívÝSpû3Zïk
¡¦│┘sN^+·(~'üóÅ«ëb╝‗ê¯À.F·ñ!¬ÈªÔÆµ¡iö~wì­ÿ«TýÐ¼÷&D¸T+¦uÅÅã‗ä╬Õ┘Tt¦H<Ñ┘x│UÜ╣»├:m─X║´³N#ç┤ E¼Ê¢D/Oåç9]┐ºàk¬░Q´_yXðUéíË¬Q?©ié"UëÍƒjút┌U«3÷h%¡┘;kÅcõk;mÞLÀ{ì¿4íÖih▄╣G<■‗_Ç®Ôßön┴ùW:C╦Ûg	&jGÜ!KÓ¼çiÇr&>EÇ╚îç^|E│Z¡8╦i¯ðz}T¤Yü6▀─┌¥{öBó¡╠Â ø9<4═+g%¡Ç·kºÿÔÓZ}+òn9┼(p°│M¸ì<║ö│	¦®=³└UÏ║vúü¾Ü5ÊUz┤
üéZ (ÊBhtÒ_Pè¾î«┼½ÑàÐìÔ£Ëò½┼
-║Õ%$àõÇ©áK±ÿ,þej|▀║T▀8Ëâ│»t	*PäOÚú┘FþÚ▓█9.└£ÀÊTØºÂ‗ªÆö┤Ê╝█¥âè╬&Þ\d┤ÞZƒÉèïéµÌýi¨█Ñk[Õó³%ñÑýÈo¢Xö/0ÍhtÎ®y'┤tÞyÚ^áôb
`Ìr¿M+<3´·¶┤┌×╗nrxöQó<j°j┤ÒQNw«ƒ÷¬├lZù¶_Çôñù¶» >ÃúÈ·XË┌|ÒÐäµôLÕn*öÜ¦¼þ\×ÇÔ║ƒÐÁÄ╦!²gOÀÆ£`©╠Ì½Ì║
Ä9ñÛa[ÐmYqYð╣k &`õò│RìÞ4╔	&l)h³kñwÛ('tu|}î├jý©ä Éq ø$è7ƒðgvz|nùÿÔ1û─±~©i÷I;ÒýgÏÌñy#A9-═ÍÍ
Ã╣°wÐ¼r¤ôî>Ñ*ÊéÛÁÔ/ù%Fk
ø├▀<×÷év¡÷«é%Ë2è╔<Ü─├¨¦┼║Îù¾¯%	nÊK¹"¬▒xÖçú~╚mí╔^^ä│)=ÿÍ┼Â¿tpælyr^ðþ¯YÓôz E├┬\õI®m¼Ö$í┼═í½D-,epµ?p┴ú!¶iú$QÖ╬c╬0@ÞvVÞ═Fxr‗?OÊ▓°fRøÁ─(-ÅGÿñòÞÊ·­=ye┐Æ%ðÖO▀my<¯Wî¢´é4c╦3¾?ïGßÒ      «   é  x£Mù█ì¦@C┐Á┼úyO® ²ÎR┤ö X@'w´è÷H4²þÀØe²\¾ƒ?┐mú¯═zınúÛn│Ûa½Ûi╗ÛeºÛm7Ûì·Ï½ G»V­╠½¾hµız©y§¦╝ÜÅa^¦Ã4»÷cÖW ▒═o┴1/ÒZ/ÒY/Î^
ªÒËéÄƒÇâbXù³Ñ9¡´Ì╠\¨-└¸^┴ÁÐ
×
OX═å@Î┬Ý║VÀ
t¡ac,º`█êªèÎ▒M_ø¡Ó┘¶ä¦l÷À9
pÞ│`Ï\Ëµ.X6O┴Â
  wk¥¼»¡û§│Õ_ìï[ÛÄ;ëKXÛ╬;┘m═£!³ÚÁ
ª¡]▀YÂÈØƒl[║~▄p³,]?nÝmÂ[┬yÂC@├┐Ý1pÂÃ'╩÷ÈºÃ»
s¥U-L+|åCSupb¬.ÄKı├ë¿‗å¾°JÃ]·╩²_ë┐}0¤┬Ëî}:_╣í¹+Åì&▄««	¾m7║q║Ý÷»t╗Ò+╗¦Þå╔é╩§òË¯■╩e7║A-À¸f}ý¥¼»¢û§│þ_ì¦}=kÀ7▓¯÷‗NÔåDS▄¼Ýï«©Ï┌ºÂÛm´µ ├4^Í4ìû Ëhjî!äi┤«S├ãz¹NÙm~5`}5np█¨e▄╠vp;█M└
m/¦ÕYZVvÃ║║<ïÇ÷‗,£ÍıÕY8╣┼c_	P ¤"@ü<ï ‗,╚│P ¤"@ü<░iÜ=
õY(Þ®`s┌RvÎ{*└¯zOÏ-´® ╦Ù=`{]×ÕuÇp┌R└üî(Ég8õ+
ãNÇ
d`(Éüá@FÇþ
f*©P0S┴ÕâCSÇØÇüï
©"P #@┴g` (°ÙƒàaüáÓ¾06╚─P #@üLî└GÎJÇÖü╦~á@&FÇÖ
v*xP Ùjt²ýïäÂ▓░ ¶òìuN<ƒÖ╗êÌrèðZûäÌ▓Á 4ùÁí╗ýìäUw9\┤╚õ:GZõsØ3
-▓:&¼ì╦Ý"
ð▄N¥+¤┬we{╠	ÿ;ù¾1(Óñ]µÃñÇËu¨úÐeü╠
8Eù2,Ó&║î0ƒ╦â­#;dÆÓu╚âáEû-2┼ hæ-Æ¿Uã-▓ã hæ9Aï³æaàZÕÉ┤>~._ó┘┐"·}+éì╦G¼H¦c_@Ð}ã┬Çf▄▓╚ <UeÆAx╦%â­ÉòMß)+ƒÔº1Zà3¼▓╦*i═­╩.»ñ9├,╗╠Æ÷Àýr╦ hæ]Aï³2ZdÿAð"ÃÔ»=ª┘ñ═£Îï£ëÂ¿3Ë
ª┌ ¯╔d«
Ô×0└×"µ\ißÍå█ó╦t[─░┤─F1▀┼F1ÓÆVlnPl#nPl3nPlCnÐf╩-:î╣Eî£¡ê	└ô`ñ]Fõî║EL└│h0ýMª¦"µÕÊ;Ý│┤\ãþÊr#±EõMzæyï"¶1█J¸äyVZ©'ï╣Àh3°&▀ó╦Þ[¶ÿ}?┬F1³9ËoþØV¦╣{æâ©{|ðÙ wo1q¸6CpÐa.b&mEÅI8êø┴ªùnå3q3ágÐ`.b6«ù#gá«À#gT«Î#gV«¸#Å░\-‗V╬gBÌä¯_╝d4D?╣i³?▀§ø|:Eâ┐]ä¯‗V~Å'-o┼l┬ê╗¼ò└W(OÇH+Õ½0x░÷òÌë»[║cþä}ÄKÔº+ë>#Ã¢æT8-§7pØ Èùwv+7ã▀├Ò®·a·ã?7ãL╣fè2­j&kªq<¥Ô~²³³³Û`¼═      ░      x£Ø[═r█HÆ>OüË­▓Û`³Øe®m¸Jjìõ¯┘ÏÖ=╔"YðÇ-§s╠ã^÷░ÐºVµ4ù9¾MµI÷╦,PDü$wä├aK§ƒÖ_~¨â¹┬,õLyßPx┬y]/ýåÔ¼█;┬¹ÙìÀ0*Ö¡­/ 2╔ì
µ¬xÍi2Wµ¶1g³2º4þJkUõ┤³ CòíßÓhÞBNì■Rð&Y░æ╔|¸╝Í╝¤ôE┘┘ú│░ÂæÅz×t³£ ¬»×®YnùûYå?:┴╩QÖ±¥PãÓ¸¾┬Ì0└■╩,w¤¹àäÑéL&K^&2ÆÎ┐▄'L¦=®ì‗T▓îuÂ‗F■~*,Ñ╝ê&§ý¥WXløj┌Yq']O1½▄2‗/­¾,-î╬ò¾ã½t¢ã│ê¿▀r¦+¢,_rnõ2Ñâ╗:~²ác F/W9vTÏdT┘Î▀ñ╬jxÕÖN¥zº®±┤t¢░6->`Økepá╬e‗áþZm{K£▓Iµ┴¡J71╔},*r¤║ßY╚ÙÝ╩7]Ë-âà*<køÌHÆr╣IHÊ¹¼
Æ´lU╠Vi«
Òàú¿*?üùtÐ╩Érü×ı┘=¤R3[Ý×qÃæ¿¬┐Þ×ëÐÚë!äêÒæYäØwa§¼2Ï╩8ã¬t©s¨s.þÏ╣─àí;¶ÙRP╝neëw+ô&d=-·¨W¼d0ß┤LµÏ&ºçä_c|óyíbO¶¬b¥4▒Jµà	¯À
´×Ñ/w!C┤Cº	ëÙ^%ë─·Ò»╝BX^┴$¼JäíÎ¬»╣{^¬d■╩K ot¾âôIcì■Î¡Í°RÞ└ý~█JMÔ-Æ`¬þtÐÄ╩22w+÷"Qñ\¼UHâÛ█]kóï§a¨Æ ü¼ò,░°»╦*7ê¥FPæ 1╔rØ╠rÅÝ▒ :Ì¶XÂ÷yâÑ4░Ê─WÑ41╣é$âoËƒÔ²¼KÕJÜÁ=╬╠ñ│t«c£x\}ıI¼â;ì§3┐#ïäålî²^Ù­×¹█hëà├Íæ}6úºE"cF½¦/kv&#Ã▄╗p'ÌÚíÈ¤éX»5l%Hº┘¼0Õ█AºÕRCû²*‗L╚║ Kÿ└L╦\ºc¥Ð+Ìä&þ$?z»¡Jr▄}¶òã ³╗éRv1Ë©]8t£╗õÊÿºÓCWñlvøBM░¹?¿![l=Fê#¾‗┬^Uı9òÃÚý■^╬â ò┴╝¿
M¶|´V
Àç\CsuÉö`«ë+╚½├ƒÎ©Wø<x½EV┼└âZ<¿XÕ░╣WO@µQ½nD■=▄6╠è
╠v
5ÝÍ▄║▀ÇU")t╬zpº×>?╚¡~  Ví# ¹
¨]RÄÓ╗4[2°#ÚD\=Ëÿ£=½R8Üþ└‗2-°?ÇºæÒdT .8`Y%UÎ(³ïÏU¶╝^¦ï¬õK▒¹-ÀÜRÂæP┘ÓÃâ ~È│\CÚC!å^Å|÷­E±g­ÍòF■¡IÎäø^┐.ô7L'╔└(wÀd,M¡7<Ã:*ıÖ¨÷¼ô5╗g¿>O¹ÿ╠$¨òQ;À+º¡WÊõYÑå╔tÛºoe@P╔<5ä─‗èÄ╗¡,³╔6_æ├├*ïØ|s¾═¹o.┐®£¡Cxã0"cG┐*^ı#├ïSÇ┘~▄æüLô·x├¬┬╠?▒PÞR?Ú°@\,█└»J┤┤mý╬Á>ýX#Y Uû6òbI£$[|Óþ<],░%¿»ÂggP;╚ðÈÉç×IúójúûþÝ┘[>├­,\ÑY0Iûè¼ÞVºZ³<O3L;▄ú░ö)│ü2ô┌
Ø└
"ƒR;VvK´┴×£Bµ^┐╩à>I#âï┌£N|ÅÓY6┤éÚ¾5Ì)#XwÌþ─dl┘)bÂtK!¢A»}©▀Á23├xø┤q,Ô¸Ò:È┤ónõ_ãð/`dG%█4÷F┬Ö▄╩}êw-AÊÖÏ8àìßUs\╗È╔eL┴´0|ôBç¼Y Eû²ç5åºÊ┌┴V«7║▄§
║H'ú┌§íÀê)ùýé▒B³YÃ│¶±á-´aêmµ©æÐÝ┐óaÓfûÔÐ╬F╬èý®¸u;Cå:#³¹é§·ÁÚo@fÉò┤X¬│ejûöÞıêJ¸Q▒o7ôK+åQÄç'&à.╗¸å«▀MD|n°│§¯7└4Ìa|¶|.┴▒«×æb·Ô§úW¶¦┐ûP`╝tdÓÞÃ»¡\´,¡`m└â╔╔4Y[,¢Ðá÷·▓╚Ë╣\É▄▄¡t¸Ø╔|àâW▒┐Ô ×Þ°═¤G«4¾£0Úc2Îdæƒ┬ é§┌‗¿9d<÷éÏ¼þ¡'×oõ▀´AéX1█╦
Pþ­~£R8Ih|ºdrv.7÷Ø&s╣╬ª©åïð│"^ÝVfDı\èÊ?âgrs(Ø}×ê
Ä─í╝ôª£äU57¼═$óe#¿+╣üO®j╠ÐH▓╝öÔã©Pl╝^Ò`IR╩%┴└É)yì¨ƒÙ2ÊÌñ1¹ïq§º©ðù▓³s:x
¸^ÖBª└╬Õ<}dkı├ü¶S¾╚â|Lád	Þ@Òe▀+│Í0¤q¥§ÃC─BFY>GK·Å¢ı4èP}ÆÈí,×d£:+q'ÁöùYL
╩êuù²?ö▄Æõ─¾ìÜ┼╝\°╗û¹×n©Ñá®{f«/Þ·ô 6ƒÅ°¸qhþÄ³¾¦¾
ÉÉµ°_-┴▓]ZıÆTÓKy║4r│R%çª┐¤S°KIl("-ý[├ÚrlZ3╣[Ó+|GC6Qy╝­ñ0Õ\n╔ú1ææ┴¶ÇÏÍ░²J}└┘ÜØ?,╔Pãµëc Cü7ªTº\╗UãQ■Û¢tÆı	6ñ├²┴Vh╗n¶╩¶¿\b░0B'¡uk├²rkÇõ`°Û£ù]V¼7N"Û¶Ne[r¿OÀZ=Ý~┼vCç┬╣Qò­┐-Ô8©V9|¦$C¢AP├&Ð¥çÞ%i█░U█8{ÀB¶
Y«)%M▓Äør"┌åßUàÐU├ù÷²Ís	 å|Wã¨yP┤"│Ñôn$ÿ9¹þQØ‗×pÌ ║I ┴B(x╝Oþ)xv#║]3#eÑüºJ ÃÌ░█4Ð§‗ÕXÃ!?oñqíA	╬Æ/PÔH‗K.Ì╚í┼çù³.└ä─Ì¿û¿he‗TÖ"▄bÆ@åLÁÉ┌M.ÀÆ|LLÞY═õ╔`<·═Rf»ï╠Í┘­ujyÐÐß1 L n÷ÚØ=ù6Ì¿┘ÖwRÑA ;▀þ`«oXgÈ
G░Qî*cë$]K¬─Ý¾]Ôhƒë6k╠Á╣ã¹b»/¾┬H~/o▄¿=W£Q	AQG°ÞaØÉ6é│Á(xc[M$´éá▀®?£ÔÈ]K6Óm╝║Ð╠äEX▀¨ãMkß ¨±-ƒ~╔iÅÛ~┬àA*┤5\ËÛı¸zâÁ ®:VXxM┴,Bƒzl?8█S▒I-^6rúÒÿ╠Á×}├·■;r┐òðÅ9h´¢è░ã¥°·ìå@û¦¾▄W&çç¨Mı
õ╝Ço▓┬╠Ë>OýÐ▒2s¥,2t&åÏíhßÍdÓårz£ÑºT:ã¸┌_╦ý╦>├5í║Æ╝&G■çtØ┬Ù»`G$ý`oõ:┴&╚ùßDÒ»XA'╦"µlÀh┤_ ╬‗É"█└ÿv┐ó
^ïBà 	ë9ËÿïP¨┐õreç═!/╚|
²<NgT^8╔EW[áÿS²1°lbèKmıßµ,ÝU¶ßxBä-b
╚╚T@!&¼ßò£ÆÑøö╔IH	¾åÝ¾╩óð¯6¿²,)ùßõq║é¬©'ýæÆ?:┘JÄ½ÓAAÂ`(Ò÷²å½Þêú*û¾‗Óhó}ÌÏ┐▀¨S<òqýE6ë░ÀJ±█Âd╠á_öõ╚-$:L²G(kz░Â[iÏi╬VuÆ}
+âuz¢^Ý┬ô░¢─R)ç¼7:÷■ñ═Sò<Ì╗¾1ú
ı¿i░
()Qak─{¼p¬·╬îJxÉSZ▄4║GúÀx>ÁçC20'¬5Dói┌á,$Ô╬e\Cèg┬ª9e=átvî&└û¤pA░ä×Ë6@
ØziA§▀ì═ZQëA¯ô,Í$ßaôä├jÍ×y	¶ÔB{ÒÛ§■<╣╗=ýRãgxµqÁEç┌ó#,┌ý~┴cÃ¹(è,öx■ò¨ÖpR¤-┘u█HSLsP °ÆE▒µ2╝¡]aÖ±█ûÚ¨´áðIJ|éÐ8âÁ õ9U`ä├*ZûüÙJ	B òðîÕvØU_Bb╚
@█óÍæ¼< 1┘ız®^Zþì}'ßÍ║O$*D5└A┤â─§_ÖâÎKA+4îÞ	wÓ×Ú─î¥møs,/£$õ╗ùw?£W|7┤P!Õ¯ñÁNÓSø`±»└½»Ë-FÅÜGS¨6YRu└öîfÈm=­'ÑØ╗*çRÂg┼E:Ióu▓)ùl╦çº#ÅÀÕ▒░0äA▄T│ı─Oëe8iéÒ┤BH╝É█©¿-¿Ï¬3█ß¢(ü¥2│Ü┌Ã®m	┼ü▀WÏ┬Ìq─═h¸ÄÎÞñfn;nWÈà‗êeÄ+W¯2²Cn,S3C┤─╬|áý▓üMv(¶Të▀Û9põ®æSJ­Ë¬Âƒ╩Æä■_«ï 
«°ãPü┴£┼¾Oý^S½m¯Çù²╦éıI^¯%├Q░W§B±µu"Vë &¸æ▒|)>cí×╗Rc╗ù¡xÏ?N<'®ÎR¤A d½g╩6 :®×Ò"q▓Ã@n)º­┬ƒ!¸└ôÏ`1"Áõ^Ùs╩mt=º¼,¿6sº║õ9.ïÎrÐª6─^Í▓`µV¦¹#brCÐmâ
ò	9¨╦~Ï))T²p┐╠6x#À▀×_ uVëéBwê»q│JOM╚¦²÷*þº>YNÁÅBHNäQ=ÇlmèèÌ┌·,§Y▀¤[òç
├z8Ï║ƒ╔Ê	­Ø└¿)E%XÑ×j]ÑWit ñ╬VTÅÛ╔ùÍ%FUöÕÜ$ä┴9┴b=Ë║ÊÿÊÿÈ6¶D╝èÊ¾Å@áz╚ÍZR■}«ùk	±Dñ╗oÞ╚
²HZßÉNðÑ¹D>¿òÆsáz{W█­┼pBM%[*4:÷═àüÉH>N»s¯:4j╦1ZN÷7³]+F¹~─Æ®╬╩"æè3o³╗ÍÙ├╝Íøîk´Ü&É├³]+ì@▄ºU¤µÛlúdrP}Û╦CÌB▀ÕfòÜä×zÑ8"│┬ûzô's*
×ÄÞvÑß:Óäc‗A¹*XXÙ(hqaÁÒÆ|Ö^hÛá>Ûìx ,  %¸ðC└?ıÈ\ÚMHu~W═gn§l░g_>¾zæSm╩Q§+¢A´╠¯ùäJì)àEyÓòoÄ ¯þ9ÔçNóÝ§êN¼à°H┼zƒ¢í╬L¿å÷Å<¯Z▄§lÒz░├±ñ.ÛÐ±ph¬┌s▀]xöûl┼▒ð?Ã;ÞdëÖN├ÉK:®├~CÚ,I/ßnÛ┌²Iù2èILYµYa¡;­ò¨├¢Ö░╦Ù|ƒ<ü%F§LaÙ úÐ2▒P_W´÷├ç■¢mbYô§└<Ù/▄
¾ ┼òTIè{Pmçl╝³µ­╬ô<]?└±;yð¹ò4i­çÓæv×ÜÞä┌I║├F±!h£>®5░■­¡¡ü²╩ßC¥Îv°ð┐▄"È╠Ç¸└B¸ì┐¦²0°È^E4~█,p©½t¸¤▓ôgÓ¬Ûæá┌rUTºï▒9´WÖÛgþiè0└	zølA¼m┐ƒS]}_ª╬\ý.ÌÂ╗
Êßr05 ·█ ■Ù┐ ç:,▒{:r─Ùñ\[û1¢┼â‗þ: p6´'\╬Í▄■╚>i«Õ┌ ╠lþòêjí═¼åÆ'ÎÞöº/¤±©)O*"±ÍUl┴╔v╔)?D»1#\æÔìä:Ý×i│^[ KÚ
Ø zÍSóñóÍ_┌+	█ý╗|ë"Dìè66<│Ë¢K5õd╗╬aW-E/%P¹þ‗Þöó▀°
7Êyèìu¯2rØù}ÿ6Í<*6┤#"ıÜ¨██┘Fu"▀
*!5[,­#└£ôO¼¸ÀFÍ8rµGêhÓó¥└^¢LTa!B&	NUÚ╝ ¦%¥Rføò9┼M└░cÛgb├4VJTÈ,I4 ðD&ã§╦Â┬ ­¦¦▄´┐²Ð¥÷H=Øó╣▓■-n‗|éwã(Ð$·sbáy▄░îacMõbSµCóf%╩╣Á╠#ôïaÒ#Ì╔¡"Þñ.XIM~M/ ╗Á┼àà╠)G▄¡¹¹Íw┐4\¸Ï½·FãR█ÂR
╔~Ó▄xYº┴ß8øÝæ>!ôÑ·UÚc·¡Ëz■¸ËXo§j-¨ì¸µ2Q╠mı÷;
ÃaÀ|ıÐ+?ØÕ½uÏ½┐W½QràÔ│óÌ[ı░¨=Ù═ãm(èßÈN¦Í;X¨RìR7:þ╝í═óÊ┐­ÆâÍù¼‗t½×þêç {▄ÔV+
e║ì:╠â
³µ▀ml·Ü<hj`¦w;ƒÉõzÂÅ╬╣e▀I~Î M╝ä█UºË┌¾á9Ò¤:D│¾Ò/├tN▀ì8²ıG¹wOfqW▓ýÊ╬J÷@L±©╗█
_B

rM─-t*§MmçþúmÈ3~ñq╦°>Ú╠îË█tó¤Êpá¯¿┘ý¸òöªñª┘¡"Ùäu═SÃRb-ûd?N"À~─¨0\%µo`┬ûæ#`GÆµê Ý¸2Q╦Ï▒ÅûÛ{└ƒUÞØ■£Z=éiÑ}╔vCÂÝÔr±=l«ƒ└eªÏ|J┤hF▀èZøyÈ─ÞƒËD┬ê▒rsí║*r*ÀSBKøï,6Ðw_└WS¥ÿ£╦©qpƒ·ñ╔ Ï└┴ÂqƒÚtJÛ7^¿Ø┬«½3ıxè¥Y+ª┤╩░i½k9.Ê%U½┬ã├S├yLÕ9§NcWmd▀┐▄º`×àK=¢±ø┤Z Øæ}ÅÐk▄`l?Qûù\	Ó£e\j┼F¢Àmõ_(Ö»éøöR╬¦Ü*═²ã¸² ÖÛ&┘      ▓   
   x£ïÐÒÔÔ ┼ ®      ┤   å   x£MÄK┬0DÎ×├ ┬ƒ╗░iâıD┤qêôóÌ×ö
)╗Ö'=Å
§"/u<╬¶.¼┘K└íüÍëÀî#u¤╔eÓÉËéu%;è£&»║ZþìIJ─e+E9ßJVB«Z^"k[p#Õƒ¡ Ç{3¥ÌÉ│oX▀)├ÿûÈË>-ƒPw; _âÔLß      Â   ¢  x£ìö¦Ä█ F»ØºÞ}ÁÐå<K%D6AÁìïÝh¾÷Ô┼«Í+þå°├ÖXØ}7┌n¢* @Ý:7:ËT¥!╝í°ü³äÔp$TI┼9É╩LÒm/üGñ└ÑL	ZÖKÙ║²eBíJÂDên³5:ÏÍ▀¡Ä¸{m.ù_ta─£6þÐ¨N┐7µ¬¤7´╬Ð└&K.1▒─]õ│ÜyCº¦ÖÍnóÿá@iBı┼Ðªmð¢
¡åTR╩ÙÍ|ÞãvÎxjUK*s+dAÐ5
q▒¡q═ÙU(lMIK.Ã¸ÒÂª@VìP|═h╠0&§.¥ljÂø╬A	"2ED╗'èÌý]'i{Ée>Ù╣ö╗i▄┼î>╣¹6tkç┴\┐i<Gü47i┴╔M;;Ü╣ás▀æÆ·ÔÞ%T-a┼?Q3Û³È┐åQî░'FÛ®Åè¼¯â x¼&‗?úî3Æ§½Ì]x±Yöé'KV┐¢ 3▄ls▀ ,jJÖ$9º¬┴╬ı¯ãÍÆþÙ³y~,)äÇBúê'Íq"pÔpõö½þ░²:ç]▓vÏ      ©   
   x£ïÐÒÔÔ ┼ ®      ║   
   x£ïÐÒÔÔ ┼ ®      â    ¢           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            ¥           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            ┐           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            └           1262    33662 	   bookshelf    DATABASE     ë   CREATE DATABASE bookshelf WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE bookshelf;
             postgres    false            ─            1259    33663 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false            ┼            1259    33666    auth_group_id_seq    SEQUENCE     ë   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    196            ┴           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    197            ã            1259    33668    auth_group_permissions    TABLE     è   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false            Ã            1259    33671    auth_group_permissions_id_seq    SEQUENCE     å   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    198            ┬           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    199            ╚            1259    33673    auth_permission    TABLE     ┐   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false            ╔            1259    33676    auth_permission_id_seq    SEQUENCE     Ä   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    200            ├           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    201            ╩            1259    33678 	   auth_user    TABLE     ▀  CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);
    DROP TABLE public.auth_user;
       public         postgres    false            ╦            1259    33684    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false            ╠            1259    33687    auth_user_groups_id_seq    SEQUENCE     Ç   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    203            ─           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       postgres    false    204            ═            1259    33689    auth_user_id_seq    SEQUENCE     ê   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    202            ┼           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       postgres    false    205            ╬            1259    33691    auth_user_user_permissions    TABLE     ì   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false            ¤            1259    33694 !   auth_user_user_permissions_id_seq    SEQUENCE     è   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    206            ã           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       postgres    false    207            ð            1259    33696    author    TABLE     ï   CREATE TABLE public.author (
    id integer NOT NULL,
    firstname character varying NOT NULL,
    lastname character varying NOT NULL
);
    DROP TABLE public.author;
       public         postgres    false            Ð            1259    33702 
   author_id_seq    SEQUENCE     v   CREATE SEQUENCE public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.author_id_seq;
       public       postgres    false    208            Ã           0    0 
   author_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;
            public       postgres    false    209            Ê            1259    33704    base    TABLE     è   CREATE TABLE public.base (
    owner_id integer,
    author_id integer NOT NULL,
    book_id integer NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.base;
       public         postgres    false            Ë            1259    33707    base_id_seq    SEQUENCE     â   CREATE SEQUENCE public.base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.base_id_seq;
       public       postgres    false    210            ╚           0    0    base_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.base_id_seq OWNED BY public.base.id;
            public       postgres    false    211            È            1259    33709    book    TABLE     X  CREATE TABLE public.book (
    title character varying NOT NULL,
    id integer NOT NULL,
    format integer DEFAULT '-1'::integer,
    mark integer DEFAULT '-1'::integer,
    type integer,
    date_end_reading date,
    series character varying,
    language character varying DEFAULT 'french'::character varying,
    series_number integer
);
    DROP TABLE public.book;
       public         postgres    false            ı            1259    33718    book_id_seq    SEQUENCE     â   CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.book_id_seq;
       public       postgres    false    212            ╔           0    0    book_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;
            public       postgres    false    213            Í            1259    33720    django_admin_log    TABLE     ê  CREATE TABLE public.django_admin_log (
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
 $   DROP TABLE public.django_admin_log;
       public         postgres    false            Î            1259    33727    django_admin_log_id_seq    SEQUENCE     Å   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    214            ╩           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    215            Ï            1259    33729    django_content_type    TABLE     ƒ   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false            ┘            1259    33732    django_content_type_id_seq    SEQUENCE     Æ   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    216            ╦           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    217            ┌            1259    33734    django_migrations    TABLE     ─   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false            █            1259    33740    django_migrations_id_seq    SEQUENCE     ü   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    218            ╠           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    219            ▄            1259    33742    django_session    TABLE     ¬   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false            ¦            1259    33748    owner_id_seq    SEQUENCE     u   CREATE SEQUENCE public.owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.owner_id_seq;
       public       postgres    false            Ì            1259    33750    owner    TABLE     ì   CREATE TABLE public.owner (
    id integer DEFAULT nextval('public.owner_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.owner;
       public         postgres    false    221            ð
           2604    33757 
   auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            Ð
           2604    33758    auth_group_permissions id    DEFAULT     å   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            Ê
           2604    33759    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            Ë
           2604    33760    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    202            È
           2604    33761    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203            ı
           2604    33762    auth_user_user_permissions id    DEFAULT     Ä   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            Í
           2604    33763 	   author id    DEFAULT     f   ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);
 8   ALTER TABLE public.author ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            Î
           2604    33764    base id    DEFAULT     b   ALTER TABLE ONLY public.base ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);
 6   ALTER TABLE public.base ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            █
           2604    33765    book id    DEFAULT     b   ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);
 6   ALTER TABLE public.book ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212            ▄
           2604    33766    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            Ì
           2604    33767    django_content_type id    DEFAULT     Ç   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            ▀
           2604    33768    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218            á          0    33663 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    196          ó          0    33668    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    198   #       ñ          0    33673    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    200   @       ª          0    33678 	   auth_user 
   TABLE DATA               ò   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    202          º          0    33684    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    203   2       ¬          0    33691    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    206   O       ¼          0    33696    author 
   TABLE DATA               9   COPY public.author (id, firstname, lastname) FROM stdin;
    public       postgres    false    208   l       «          0    33704    base 
   TABLE DATA               @   COPY public.base (owner_id, author_id, book_id, id) FROM stdin;
    public       postgres    false    210   d       ░          0    33709    book 
   TABLE DATA               p   COPY public.book (title, id, format, mark, type, date_end_reading, series, language, series_number) FROM stdin;
    public       postgres    false    212   ÷
       ▓          0    33720    django_admin_log 
   TABLE DATA               è   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    214   7       ┤          0    33729    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    216   T       Â          0    33734    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    218   Û       ©          0    33742    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    220   À       ║          0    33750    owner 
   TABLE DATA               )   COPY public.owner (id, name) FROM stdin;
    public       postgres    false    222   È       ═           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    197            ╬           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    199            ¤           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 1, false);
            public       postgres    false    201            ð           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       postgres    false    204            Ð           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);
            public       postgres    false    205            Ê           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    207            Ë           0    0 
   author_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.author_id_seq', 1, false);
            public       postgres    false    209            È           0    0    base_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.base_id_seq', 1, false);
            public       postgres    false    211            ı           0    0    book_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.book_id_seq', 1, false);
            public       postgres    false    213            Í           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
            public       postgres    false    215            Î           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 1, false);
            public       postgres    false    217            Ï           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 1, false);
            public       postgres    false    219            ┘           0    0    owner_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.owner_id_seq', 1, false);
            public       postgres    false    221            Ò
           2606    33772    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    196            Þ
           2606    33774 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     á   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    198    198            Ù
           2606    33776 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    198            Õ
           2606    33778    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    196            ¯
           2606    33780 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     û   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    200    200            ­
           2606    33782 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    200            °
           2606    33784 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    203            ¹
           2606    33786 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     ê   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    203    203            ‗
           2606    33788    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    202            ■
           2606    33790 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    206                       2606    33792 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     ª   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 â   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    206    206            §
           2606    33794     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    202                       2606    33796    author author_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pk;
       public         postgres    false    208                       2606    33798    base base_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.base DROP CONSTRAINT base_pkey;
       public         postgres    false    210            	           2606    33800    book book_pk 
   CONSTRAINT     J   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pk;
       public         postgres    false    212                       2606    33802 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    214                       2606    33804 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     î   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    216    216                       2606    33806 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    216                       2606    33808 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    218                       2606    33810 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    220                       2606    33812 
   owner o_pk 
   CONSTRAINT     H   ALTER TABLE ONLY public.owner
    ADD CONSTRAINT o_pk PRIMARY KEY (id);
 4   ALTER TABLE ONLY public.owner DROP CONSTRAINT o_pk;
       public         postgres    false    222            ß
           1259    33813    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    196            µ
           1259    33814 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    198            Ú
           1259    33815 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    198            ý
           1259    33816 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    200            ÷
           1259    33817 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    203            ¨
           1259    33818 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    203            ³
           1259    33819 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     ü   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    206             
           1259    33820 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    206            ¾
           1259    33821     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    202                       1259    33822    author_id_uindex    INDEX     H   CREATE UNIQUE INDEX author_id_uindex ON public.author USING btree (id);
 $   DROP INDEX public.author_id_uindex;
       public         postgres    false    208                       1259    33823    book_id_uindex    INDEX     D   CREATE UNIQUE INDEX book_id_uindex ON public.book USING btree (id);
 "   DROP INDEX public.book_id_uindex;
       public         postgres    false    212            
           1259    33824 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    214            
           1259    33825 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    214                       1259    33826 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    220                       1259    33827 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    220                       1259    33828    owner_name_uindex    INDEX     J   CREATE UNIQUE INDEX owner_name_uindex ON public.owner USING btree (name);
 %   DROP INDEX public.owner_name_uindex;
       public         postgres    false    222                       2606    33829 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm 
   FK CONSTRAINT     ▄   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    200    198    2800                       2606    33834 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id 
   FK CONSTRAINT     Ë   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    196    198    2789                       2606    33839 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co 
   FK CONSTRAINT     Ï   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    200    2833    216                       2606    33844 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id 
   FK CONSTRAINT     Ã   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    2789    196    203                       2606    33849 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id 
   FK CONSTRAINT     ├   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    202    2802    203                        2606    33854 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm 
   FK CONSTRAINT     Ó   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    200    206    2800            !           2606    33859 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id 
   FK CONSTRAINT     Î   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 Ç   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    206    202    2802            "           2606    33864    base base_author_id_fk 
   FK CONSTRAINT     x   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_author_id_fk FOREIGN KEY (author_id) REFERENCES public.author(id);
 @   ALTER TABLE ONLY public.base DROP CONSTRAINT base_author_id_fk;
       public       postgres    false    208    2820    210            #           2606    33869    base base_book_id_fk 
   FK CONSTRAINT     r   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_book_id_fk FOREIGN KEY (book_id) REFERENCES public.book(id);
 >   ALTER TABLE ONLY public.base DROP CONSTRAINT base_book_id_fk;
       public       postgres    false    2825    210    212            $           2606    33874    base base_owner_id_fk 
   FK CONSTRAINT     u   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.owner(id);
 ?   ALTER TABLE ONLY public.base DROP CONSTRAINT base_owner_id_fk;
       public       postgres    false    210    222    2841            %           2606    33879 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co 
   FK CONSTRAINT     ┌   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    214    2833    216            &           2606    33884 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id 
   FK CONSTRAINT     ├   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    214    202    2802           
