toc.dat                                                                                             0000600 0004000 0002000 00000120152 14212750305 0014437 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP           ,                z         	   bookshelf    11.7    11.7 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false         �           1262    33662 	   bookshelf    DATABASE     �   CREATE DATABASE bookshelf WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE bookshelf;
             postgres    false         �            1259    33663 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         postgres    false         �            1259    33666    auth_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public       postgres    false    196         �           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
            public       postgres    false    197         �            1259    33668    auth_group_permissions    TABLE     �   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         postgres    false         �            1259    33671    auth_group_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public       postgres    false    198         �           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
            public       postgres    false    199         �            1259    33673    auth_permission    TABLE     �   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         postgres    false         �            1259    33676    auth_permission_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public       postgres    false    200         �           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
            public       postgres    false    201         �            1259    33678 	   auth_user    TABLE     �  CREATE TABLE public.auth_user (
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
       public         postgres    false         �            1259    33684    auth_user_groups    TABLE     ~   CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);
 $   DROP TABLE public.auth_user_groups;
       public         postgres    false         �            1259    33687    auth_user_groups_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.auth_user_groups_id_seq;
       public       postgres    false    203         �           0    0    auth_user_groups_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;
            public       postgres    false    204         �            1259    33689    auth_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_user_id_seq;
       public       postgres    false    202         �           0    0    auth_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;
            public       postgres    false    205         �            1259    33691    auth_user_user_permissions    TABLE     �   CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);
 .   DROP TABLE public.auth_user_user_permissions;
       public         postgres    false         �            1259    33694 !   auth_user_user_permissions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.auth_user_user_permissions_id_seq;
       public       postgres    false    206         �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;
            public       postgres    false    207         �            1259    33696    author    TABLE     �   CREATE TABLE public.author (
    id integer NOT NULL,
    firstname character varying NOT NULL,
    lastname character varying NOT NULL
);
    DROP TABLE public.author;
       public         postgres    false         �            1259    33702    author_id_seq    SEQUENCE     v   CREATE SEQUENCE public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.author_id_seq;
       public       postgres    false    208         �           0    0    author_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;
            public       postgres    false    209         �            1259    33704    base    TABLE     �   CREATE TABLE public.base (
    owner_id integer,
    author_id integer NOT NULL,
    book_id integer NOT NULL,
    id integer NOT NULL
);
    DROP TABLE public.base;
       public         postgres    false         �            1259    33707    base_id_seq    SEQUENCE     �   CREATE SEQUENCE public.base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.base_id_seq;
       public       postgres    false    210         �           0    0    base_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.base_id_seq OWNED BY public.base.id;
            public       postgres    false    211         �            1259    33709    book    TABLE     X  CREATE TABLE public.book (
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
       public         postgres    false         �            1259    33718    book_id_seq    SEQUENCE     �   CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.book_id_seq;
       public       postgres    false    212         �           0    0    book_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;
            public       postgres    false    213         �            1259    33720    django_admin_log    TABLE     �  CREATE TABLE public.django_admin_log (
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
       public         postgres    false         �            1259    33727    django_admin_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public       postgres    false    214         �           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
            public       postgres    false    215         �            1259    33729    django_content_type    TABLE     �   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         postgres    false         �            1259    33732    django_content_type_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public       postgres    false    216         �           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
            public       postgres    false    217         �            1259    33734    django_migrations    TABLE     �   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         postgres    false         �            1259    33740    django_migrations_id_seq    SEQUENCE     �   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public       postgres    false    218         �           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
            public       postgres    false    219         �            1259    33742    django_session    TABLE     �   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         postgres    false         �            1259    33748    owner_id_seq    SEQUENCE     u   CREATE SEQUENCE public.owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.owner_id_seq;
       public       postgres    false         �            1259    33750    owner    TABLE     �   CREATE TABLE public.owner (
    id integer DEFAULT nextval('public.owner_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL
);
    DROP TABLE public.owner;
       public         postgres    false    221         �
           2604    33757    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196         �
           2604    33758    auth_group_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198         �
           2604    33759    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200         �
           2604    33760    auth_user id    DEFAULT     l   ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);
 ;   ALTER TABLE public.auth_user ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    202         �
           2604    33761    auth_user_groups id    DEFAULT     z   ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);
 B   ALTER TABLE public.auth_user_groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    204    203         �
           2604    33762    auth_user_user_permissions id    DEFAULT     �   ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);
 L   ALTER TABLE public.auth_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206         �
           2604    33763 	   author id    DEFAULT     f   ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);
 8   ALTER TABLE public.author ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208         �
           2604    33764    base id    DEFAULT     b   ALTER TABLE ONLY public.base ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);
 6   ALTER TABLE public.base ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210         �
           2604    33765    book id    DEFAULT     b   ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);
 6   ALTER TABLE public.book ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212         �
           2604    33766    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214         �
           2604    33767    django_content_type id    DEFAULT     �   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216         �
           2604    33768    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    219    218         �          0    33663 
   auth_group 
   TABLE DATA               .   COPY public.auth_group (id, name) FROM stdin;
    public       postgres    false    196       2976.dat �          0    33668    auth_group_permissions 
   TABLE DATA               M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public       postgres    false    198       2978.dat �          0    33673    auth_permission 
   TABLE DATA               N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public       postgres    false    200       2980.dat �          0    33678 	   auth_user 
   TABLE DATA               �   COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
    public       postgres    false    202       2982.dat �          0    33684    auth_user_groups 
   TABLE DATA               A   COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
    public       postgres    false    203       2983.dat �          0    33691    auth_user_user_permissions 
   TABLE DATA               P   COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public       postgres    false    206       2986.dat �          0    33696    author 
   TABLE DATA               9   COPY public.author (id, firstname, lastname) FROM stdin;
    public       postgres    false    208       2988.dat �          0    33704    base 
   TABLE DATA               @   COPY public.base (owner_id, author_id, book_id, id) FROM stdin;
    public       postgres    false    210       2990.dat �          0    33709    book 
   TABLE DATA               p   COPY public.book (title, id, format, mark, type, date_end_reading, series, language, series_number) FROM stdin;
    public       postgres    false    212       2992.dat �          0    33720    django_admin_log 
   TABLE DATA               �   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public       postgres    false    214       2994.dat �          0    33729    django_content_type 
   TABLE DATA               C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public       postgres    false    216       2996.dat �          0    33734    django_migrations 
   TABLE DATA               C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public       postgres    false    218       2998.dat �          0    33742    django_session 
   TABLE DATA               P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public       postgres    false    220       3000.dat �          0    33750    owner 
   TABLE DATA               )   COPY public.owner (id, name) FROM stdin;
    public       postgres    false    222       3002.dat �           0    0    auth_group_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);
            public       postgres    false    197         �           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);
            public       postgres    false    199         �           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 1, false);
            public       postgres    false    201         �           0    0    auth_user_groups_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);
            public       postgres    false    204         �           0    0    auth_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);
            public       postgres    false    205         �           0    0 !   auth_user_user_permissions_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);
            public       postgres    false    207         �           0    0    author_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.author_id_seq', 1, false);
            public       postgres    false    209         �           0    0    base_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.base_id_seq', 1, false);
            public       postgres    false    211         �           0    0    book_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.book_id_seq', 1, false);
            public       postgres    false    213         �           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);
            public       postgres    false    215         �           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 1, false);
            public       postgres    false    217         �           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 1, false);
            public       postgres    false    219         �           0    0    owner_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.owner_id_seq', 1, false);
            public       postgres    false    221         �
           2606    33772    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public         postgres    false    196         �
           2606    33774 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public         postgres    false    198    198         �
           2606    33776 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public         postgres    false    198         �
           2606    33778    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public         postgres    false    196         �
           2606    33780 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public         postgres    false    200    200         �
           2606    33782 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public         postgres    false    200         �
           2606    33784 &   auth_user_groups auth_user_groups_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_pkey;
       public         postgres    false    203         �
           2606    33786 @   auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);
 j   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq;
       public         postgres    false    203    203         �
           2606    33788    auth_user auth_user_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_pkey;
       public         postgres    false    202         �
           2606    33790 :   auth_user_user_permissions auth_user_user_permissions_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_pkey;
       public         postgres    false    206                    2606    33792 Y   auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq;
       public         postgres    false    206    206         �
           2606    33794     auth_user auth_user_username_key 
   CONSTRAINT     _   ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);
 J   ALTER TABLE ONLY public.auth_user DROP CONSTRAINT auth_user_username_key;
       public         postgres    false    202                    2606    33796    author author_pk 
   CONSTRAINT     N   ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.author DROP CONSTRAINT author_pk;
       public         postgres    false    208                    2606    33798    base base_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.base DROP CONSTRAINT base_pkey;
       public         postgres    false    210         	           2606    33800    book book_pk 
   CONSTRAINT     J   ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pk PRIMARY KEY (id);
 6   ALTER TABLE ONLY public.book DROP CONSTRAINT book_pk;
       public         postgres    false    212                    2606    33802 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public         postgres    false    214                    2606    33804 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public         postgres    false    216    216                    2606    33806 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public         postgres    false    216                    2606    33808 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public         postgres    false    218                    2606    33810 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public         postgres    false    220                    2606    33812 
   owner o_pk 
   CONSTRAINT     H   ALTER TABLE ONLY public.owner
    ADD CONSTRAINT o_pk PRIMARY KEY (id);
 4   ALTER TABLE ONLY public.owner DROP CONSTRAINT o_pk;
       public         postgres    false    222         �
           1259    33813    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public         postgres    false    196         �
           1259    33814 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public         postgres    false    198         �
           1259    33815 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public         postgres    false    198         �
           1259    33816 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public         postgres    false    200         �
           1259    33817 "   auth_user_groups_group_id_97559544    INDEX     c   CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);
 6   DROP INDEX public.auth_user_groups_group_id_97559544;
       public         postgres    false    203         �
           1259    33818 !   auth_user_groups_user_id_6a12ed8b    INDEX     a   CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);
 5   DROP INDEX public.auth_user_groups_user_id_6a12ed8b;
       public         postgres    false    203         �
           1259    33819 1   auth_user_user_permissions_permission_id_1fbb5f2c    INDEX     �   CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);
 E   DROP INDEX public.auth_user_user_permissions_permission_id_1fbb5f2c;
       public         postgres    false    206         �
           1259    33820 +   auth_user_user_permissions_user_id_a95ead1b    INDEX     u   CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);
 ?   DROP INDEX public.auth_user_user_permissions_user_id_a95ead1b;
       public         postgres    false    206         �
           1259    33821     auth_user_username_6821ab7c_like    INDEX     n   CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);
 4   DROP INDEX public.auth_user_username_6821ab7c_like;
       public         postgres    false    202                    1259    33822    author_id_uindex    INDEX     H   CREATE UNIQUE INDEX author_id_uindex ON public.author USING btree (id);
 $   DROP INDEX public.author_id_uindex;
       public         postgres    false    208                    1259    33823    book_id_uindex    INDEX     D   CREATE UNIQUE INDEX book_id_uindex ON public.book USING btree (id);
 "   DROP INDEX public.book_id_uindex;
       public         postgres    false    212         
           1259    33824 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public         postgres    false    214                    1259    33825 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public         postgres    false    214                    1259    33826 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public         postgres    false    220                    1259    33827 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public         postgres    false    220                    1259    33828    owner_name_uindex    INDEX     J   CREATE UNIQUE INDEX owner_name_uindex ON public.owner USING btree (name);
 %   DROP INDEX public.owner_name_uindex;
       public         postgres    false    222                    2606    33829 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public       postgres    false    200    198    2800                    2606    33834 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public       postgres    false    196    198    2789                    2606    33839 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public       postgres    false    200    2833    216                    2606    33844 D   auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 n   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id;
       public       postgres    false    2789    196    203                    2606    33849 B   auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.auth_user_groups DROP CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id;
       public       postgres    false    202    2802    203                     2606    33854 S   auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 }   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm;
       public       postgres    false    200    206    2800         !           2606    33859 V   auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 �   ALTER TABLE ONLY public.auth_user_user_permissions DROP CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id;
       public       postgres    false    206    202    2802         "           2606    33864    base base_author_id_fk    FK CONSTRAINT     x   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_author_id_fk FOREIGN KEY (author_id) REFERENCES public.author(id);
 @   ALTER TABLE ONLY public.base DROP CONSTRAINT base_author_id_fk;
       public       postgres    false    208    2820    210         #           2606    33869    base base_book_id_fk    FK CONSTRAINT     r   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_book_id_fk FOREIGN KEY (book_id) REFERENCES public.book(id);
 >   ALTER TABLE ONLY public.base DROP CONSTRAINT base_book_id_fk;
       public       postgres    false    2825    210    212         $           2606    33874    base base_owner_id_fk    FK CONSTRAINT     u   ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.owner(id);
 ?   ALTER TABLE ONLY public.base DROP CONSTRAINT base_owner_id_fk;
       public       postgres    false    210    222    2841         %           2606    33879 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public       postgres    false    214    2833    216         &           2606    33884 B   django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;
 l   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id;
       public       postgres    false    214    202    2802                                                                                                                                                                                                                                                                                                                                                                                                                              2976.dat                                                                                            0000600 0004000 0002000 00000000005 14212750305 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2978.dat                                                                                            0000600 0004000 0002000 00000000005 14212750305 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2980.dat                                                                                            0000600 0004000 0002000 00000003270 14212750305 0014255 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	Can add question	1	add_question
2	Can change question	1	change_question
3	Can delete question	1	delete_question
4	Can view question	1	view_question
5	Can add choice	2	add_choice
6	Can change choice	2	change_choice
7	Can delete choice	2	delete_choice
8	Can view choice	2	view_choice
9	Can add log entry	3	add_logentry
10	Can change log entry	3	change_logentry
11	Can delete log entry	3	delete_logentry
12	Can view log entry	3	view_logentry
13	Can add permission	4	add_permission
14	Can change permission	4	change_permission
15	Can delete permission	4	delete_permission
16	Can view permission	4	view_permission
17	Can add group	5	add_group
18	Can change group	5	change_group
19	Can delete group	5	delete_group
20	Can view group	5	view_group
21	Can add user	6	add_user
22	Can change user	6	change_user
23	Can delete user	6	delete_user
24	Can view user	6	view_user
25	Can add content type	7	add_contenttype
26	Can change content type	7	change_contenttype
27	Can delete content type	7	delete_contenttype
28	Can view content type	7	view_contenttype
29	Can add session	8	add_session
30	Can change session	8	change_session
31	Can delete session	8	delete_session
32	Can view session	8	view_session
33	Can add author	9	add_author
34	Can change author	9	change_author
35	Can delete author	9	delete_author
36	Can view author	9	view_author
37	Can add base	10	add_base
38	Can change base	10	change_base
39	Can delete base	10	delete_base
40	Can view base	10	view_base
41	Can add book	11	add_book
42	Can change book	11	change_book
43	Can delete book	11	delete_book
44	Can view book	11	view_book
45	Can add owner	12	add_owner
46	Can change owner	12	change_owner
47	Can delete owner	12	delete_owner
48	Can view owner	12	view_owner
\.


                                                                                                                                                                                                                                                                                                                                        2982.dat                                                                                            0000600 0004000 0002000 00000000005 14212750305 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2983.dat                                                                                            0000600 0004000 0002000 00000000005 14212750305 0014251 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2986.dat                                                                                            0000600 0004000 0002000 00000000005 14212750305 0014254 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2988.dat                                                                                            0000600 0004000 0002000 00000002746 14212750305 0014274 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        78	Sonja	Delzongle
0	Olivier	Truc
1	Jim	Thompson
2	Naomi	Novik
3	Fred	Vargas
4		Voltaire
5	Scott	Westerfeld
6	Emile	Zola
7	Jean-Christophe	Ruffin
8	David	Klass
9	Fabrice	Colin
10	Alain	Surget
11	Marjane	Satrapi
13	Kirk	Goldsberry
14	Jussi	Adler Olsen
16	Sophie	Audouin-Mamikonian
17	Samuel	Beckett
18	Cilla et Rofl	Börjlind
19	Pierre	Bottero
20	Albert	Camus
21	Marine	Carteron
22	Gérard	Chaliand
23	Eoin	Colfer
24	Suzanne	Collins
25	Michael	Connelly
26	Monique	De Kermadec
27	Jérôme	Delafosse
28	René	Descombes
30	Claude-Louis	Gallien
31	Georges	Orwell
32	Karen	Giebel
33	Johana	Gustawsson
35	MG	Harris
36	Markus	Heitz
37	Tony	Hillerman
39	Victor	Hugo
40	Arnaldur	Indridason
41	Eugène	Ionesco
42	Lars	Kepler
44	Erik	L'Homme
46	David	Lagercrantz
47	Stieg	Larsenn
48	Lois	Lowry
49	Hiro	Mashima
50	Cristopher	McDougall
52		Montesqieu
53	Robert	Muchamore
54	Guillaume	Musso
56	Garth	Nix
58	Eiichiro	Oda
59		ONE
60	Katsuhiro	Otomo
61	Christopher	Paolini
62	Robert	Pobi
63	Bertrand	Puard
64	Dolores	Redondo
65	Anne	Robillard
67	Karen	Rose
68	J.K.	Rowling
69	Frank	Thilliez
70	Yoshihiro	Togashi
71	J.R.R.	Tolkien
72	Yoshiki	Tonogai
73	Licia	Troisi
74	Olivier	Norek
82	William	McNeill
66	Jo	Nesbø
79	Jérome	Camut
12	Nathalie	Hug
38	Anthony	Horowitz
83	John	Steinbeck
15	Hiromu	Arakawa
29	Timothé	de Fombelle
34	Yuval	Noah Harari
43	Masashi	Kishimoto
45	Etienne	de La Boétie
51	Kentaro	Miura
57	Tsugumi	Oba
80	Michael	Connelly
81	Maxime	Chattam
75	Donato	Carrisi
76	Thomas	Bronnec
77	Marie-Monique	Robin
\.


                          2990.dat                                                                                            0000600 0004000 0002000 00000007624 14212750305 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \N	75	278	1
\N	65	220	2
\N	65	221	3
\N	65	222	4
\N	65	223	5
\N	65	224	6
\N	65	225	7
\N	65	226	8
\N	66	227	9
\N	65	228	10
\N	65	229	11
\N	65	230	12
\N	65	231	13
\N	65	232	14
\N	65	233	15
\N	65	234	16
\N	65	235	17
\N	65	236	18
\N	65	237	19
\N	65	238	20
\N	65	239	21
\N	65	240	22
\N	65	241	23
\N	65	242	24
\N	67	243	25
\N	68	244	26
\N	68	245	27
\N	68	246	28
\N	68	247	29
\N	68	248	30
\N	68	249	31
\N	68	250	32
\N	69	251	33
\N	70	252	34
\N	71	253	35
\N	71	255	37
\N	71	256	38
\N	72	257	39
\N	73	258	40
\N	73	259	41
\N	73	260	42
\N	73	261	43
\N	73	262	44
\N	73	263	45
\N	73	264	46
\N	73	265	47
\N	73	266	48
\N	2	267	49
\N	2	268	50
\N	2	269	51
\N	2	270	52
\N	74	271	53
\N	75	272	54
\N	66	273	55
\N	66	274	56
\N	74	275	57
\N	76	276	58
\N	77	277	59
\N	78	280	60
\N	78	279	61
\N	0	0	62
\N	1	1	63
\N	2	2	64
\N	0	3	65
\N	0	4	66
\N	0	5	67
\N	3	6	68
\N	3	7	69
\N	3	8	70
\N	3	9	71
\N	3	10	72
\N	3	11	73
\N	3	12	74
\N	3	13	75
\N	4	14	76
\N	5	15	77
\N	5	16	78
\N	5	17	79
\N	6	18	80
\N	7	19	81
\N	8	20	82
\N	8	21	83
\N	8	22	84
\N	9	23	85
\N	9	24	86
\N	9	25	87
\N	10	26	88
\N	10	27	89
\N	10	28	90
\N	10	29	91
\N	10	30	92
\N	10	31	93
\N	10	32	94
\N	0	33	95
\N	11	34	96
\N	12	35	97
\N	13	36	98
\N	12	37	99
\N	12	38	100
\N	12	39	101
\N	14	40	102
\N	2	41	103
\N	2	42	104
\N	2	43	105
\N	2	44	106
\N	14	45	107
\N	14	46	108
\N	14	47	109
\N	14	48	110
\N	14	49	111
\N	14	50	112
\N	14	51	113
\N	15	52	114
\N	16	53	115
\N	16	54	116
\N	16	55	117
\N	16	56	118
\N	16	57	119
\N	16	58	120
\N	16	59	121
\N	16	60	122
\N	16	61	123
\N	16	62	124
\N	16	63	125
\N	16	64	126
\N	16	65	127
\N	16	66	128
\N	16	67	129
\N	16	68	130
\N	17	69	131
\N	18	70	132
\N	19	71	133
\N	19	72	134
\N	19	73	135
\N	19	74	136
\N	19	75	137
\N	19	76	138
\N	19	77	139
\N	19	78	140
\N	19	79	141
\N	19	80	142
\N	19	81	143
\N	19	82	144
\N	20	83	145
\N	20	84	146
\N	21	85	147
\N	21	86	148
\N	21	87	149
\N	22	88	150
\N	23	89	151
\N	23	90	152
\N	23	91	153
\N	23	92	154
\N	23	93	155
\N	23	94	156
\N	23	95	157
\N	23	96	158
\N	23	97	159
\N	23	98	160
\N	23	99	161
\N	24	101	163
\N	24	102	164
\N	24	103	165
\N	25	104	166
\N	25	105	167
\N	25	106	168
\N	25	107	169
\N	25	108	170
\N	25	109	171
\N	25	110	172
\N	25	111	173
\N	26	112	174
\N	27	113	175
\N	28	114	176
\N	29	115	177
\N	29	116	178
\N	29	117	179
\N	30	118	180
\N	31	119	181
\N	32	120	182
\N	33	121	183
\N	34	122	184
\N	35	123	185
\N	35	124	186
\N	35	125	187
\N	36	126	188
\N	36	127	189
\N	36	128	190
\N	36	129	191
\N	36	130	192
\N	36	131	193
\N	36	132	194
\N	36	133	195
\N	37	134	196
\N	38	136	198
\N	38	137	199
\N	38	138	200
\N	38	139	201
\N	38	140	202
\N	39	141	203
\N	40	142	204
\N	40	143	205
\N	40	144	206
\N	40	145	207
\N	40	146	208
\N	40	147	209
\N	40	148	210
\N	40	149	211
\N	41	150	212
\N	42	151	213
\N	43	152	214
\N	44	153	215
\N	44	154	216
\N	44	155	217
\N	44	156	218
\N	44	157	219
\N	44	158	220
\N	44	159	221
\N	44	160	222
\N	44	161	223
\N	44	162	224
\N	44	163	225
\N	45	164	226
\N	46	165	227
\N	46	166	228
\N	47	167	229
\N	47	168	230
\N	47	169	231
\N	48	170	232
\N	49	171	233
\N	50	172	234
\N	51	173	235
\N	52	174	236
\N	53	175	237
\N	53	176	238
\N	53	177	239
\N	53	178	240
\N	53	179	241
\N	53	180	242
\N	53	181	243
\N	53	182	244
\N	53	183	245
\N	53	184	246
\N	53	185	247
\N	53	186	248
\N	53	187	249
\N	53	188	250
\N	53	189	251
\N	53	190	252
\N	53	191	253
\N	53	192	254
\N	54	193	255
\N	56	195	257
\N	56	196	258
\N	56	197	259
\N	56	198	260
\N	56	199	261
\N	56	200	262
\N	56	201	263
\N	57	202	264
\N	58	203	265
\N	59	204	266
\N	60	205	267
\N	61	206	268
\N	61	207	269
\N	61	208	270
\N	61	209	271
\N	62	210	272
\N	63	211	273
\N	64	212	274
\N	64	213	275
\N	64	214	276
\N	65	215	277
\N	65	216	278
\N	65	217	279
\N	65	218	280
\N	65	219	281
\N	75	281	282
\N	75	282	283
\N	80	284	285
\N	81	285	286
\N	75	286	287
\N	75	283	284
\N	75	287	288
\N	81	291	289
\N	79	35	290
\N	79	37	291
\N	79	38	292
\N	79	39	293
\N	66	194	256
\N	38	290	0
\N	38	289	294
\N	38	288	295
\N	38	254	296
\N	83	135	197
\N	38	292	297
\N	38	293	298
\N	38	294	299
\N	38	295	300
\N	38	296	301
\N	38	100	162
\N	9	297	302
\N	66	298	303
\.


                                                                                                            2992.dat                                                                                            0000600 0004000 0002000 00000040777 14212750305 0014275 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        Surface	271	1	8	0	2021-04-11	\N	french	\N
Entre deux mondes	275	1	9	0	2021-05-11	\N	french	\N
La meute	276	1	6	0	2021-05-26	\N	french	\N
La fabrique des pandémies	277	1	10	1	2021-08-21	\N	french	\N
1984	119	0	\N	0	\N	\N	french	\N
La secte des assassins	261	0	\N	0	\N	Guerres du monde émergé	french	1
Le sang des tyrans	269	1	8	0	2021-04-11	Téméraire	english	8
Rémanence	39	1	4	0	\N	Les voies de l'ombre	french	3
Des souris et des hommes	135	0	\N	0	\N	\N	french	\N
La Ligue des dragons	270	0	9	0	2021-04-11	Téméraire	english	9
Nightrise	138	0	\N	0	\N	Le pouvoir des cinq	french	3
Renaissance	238	0	\N	0	\N	Les Héritiers d'Enkidiev	french	1
Plagues and Peoples	291	1	10	1	2022-02-20	\N	english	\N
Lame de feu	127	0	\N	0	\N	Les Nains	french	2
Le jeu du chuchoteur	283	1	8	0	2021-11-01	Le chuchoteur	french	4
L'écorchée	281	1	9	0	2021-10-18	Le chuchoteur	french	2
De chair et d'os	212	0	\N	0	\N	La vallée du Baztan	french	2
Le talisman du pouvoir	260	0	\N	0	\N	Chroniques du monde émergé	french	3
Les deux combattantes	262	0	\N	0	\N	Guerres du monde émergé	french	2
Le duel	148	0	\N	0	\N	Erlendur Sveinsson	french	12
La mission de Sennar	259	0	\N	0	\N	Chroniques du monde émergé	french	2
Les derniers héros	266	0	\N	0	\N	Légendes du monde émergé	french	3
La fille du sang	265	0	\N	0	\N	Légendes du monde émergé	french	2
La fille qui rêvait d'un bidon d'essence et d'une allumette	168	0	\N	0	\N	Millénium	french	2
Un nouveau règne	263	0	\N	0	\N	Guerres du monde émergé	french	3
Instinct	38	0	5	0	\N	Les voies de l'ombre	french	4
Le dernier gardien	99	0	\N	0	\N	Artemis Fowl	french	8
Les Larmes du crocodile	295	0	\N	0	\N	Alex Rider	french	8
Jeu de tueur	254	0	\N	0	\N	Alex Rider	french	4
Scorpia	292	0	\N	0	\N	Alex Rider	french	5
Le tribunal des âmes	278	1	8	0	2021-10-08	Le tribunal des âmes	french	1
Les limites obscures de la magie	157	0	\N	0	\N	A comme Association	french	2
Nihal de la terre du vent	258	0	\N	0	\N	Chroniques du monde émergé	french	1
Rue sans-soucis	227	1	8	0	2021-05-11	Harry Hole	french	4
Harry Potter à l'école des sorciers	244	0	\N	0	\N	Harry Potter	french	1
L'île des lézards	230	0	\N	0	\N	Les Chevaliers d'Emeraude	french	5
Jeudi meurtrier	198	0	\N	0	\N	Les Sept Clefs du pouvoir	french	4
Skeleton Key	288	0	\N	0	\N	Alex Rider	french	3
Samedi suprême	200	0	\N	0	\N	Les Sept Clefs du pouvoir	french	6
Les nuits de Reyjkavik	147	0	\N	0	\N	Erlendur Sveinsson	french	13
Opération Joshua : la légende d'Ek Naab	124	0	\N	0	\N	Opération Joshua	french	2
Le gouffre noir	132	0	\N	0	\N	Le Destin des nains	french	1
Dossier 64	47	0	\N	0	\N	Les enquêtes du département V	french	4
Victime 2117	40	1	7	0	2021-01-06	Les enquêtes du département V	french	8
Promesse	50	0	\N	0	\N	Les enquêtes du département V	french	6
Le maître des tempêtes	78	0	\N	0	\N	L'Autre	french	2
Le trésor des Incas	268	1	8	0	2021-04-11	Téméraire	french	7
Les dieux ailés	240	0	\N	0	\N	Les Héritiers d'Enkidiev	french	3
Stormbreaker	290	0	\N	0	\N	Alex Rider	french	1
Absinthium	221	0	\N	0	\N	A.N.G.E.	french	7
L'âme du mal	285	1	7	0	2021-12-04	La trilogie du mal	french	1
L'île du destin	73	0	\N	0	\N	La Quête d'Ewilan	french	3
Les êtres de feu	129	0	\N	0	\N	La Guerre des nains	french	2
Le chuchoteur	272	1	7	0	2021-04-11	Le chuchoteur	french	1
L'étoffe fragile du monde	158	0	\N	0	\N	A comme Association	french	3
Sicarius	218	0	\N	0	\N	A.N.G.E.	french	4
Les égouts de Los Angeles	108	0	\N	0	\N	Harry Bosch	french	1
Langues de serpents	267	1	9	0	2021-02-09	Téméraire	french	6
Le dragon rénégat	56	0	\N	0	\N	Tara Duncan	french	4
Dans le piège de Magister	58	0	\N	0	\N	Tara Duncan	french	6
L'ultime combat	64	0	\N	0	\N	Tara Duncan	french	12
Mercredi sous les flots	197	0	\N	0	\N	Les Sept Clefs du pouvoir	french	3
Ellana l'envol	81	0	\N	0	\N	Le Pacte des Marchombres	french	2
Les frontières de glace	72	0	\N	0	\N	La Quête d'Ewilan	french	2
L'égarée	282	1	8	0	2021-10-22	Le chuchoteur	french	3
Les vampires de Londres	23	0	\N	0	\N	Les étranges soeurs Wilcox	french	1
Ceux qui tombent	105	0	\N	0	\N	Harry Bosch	french	18
L'ombre de Dracula	24	0	\N	0	\N	Les étranges soeurs Wilcox	french	2
Miséricorde	45	0	\N	0	\N	Les enquêtes du département V	french	1
Rouge-gorge	274	1	8	0	2021-05-01	Harry Hole	french	3
Les cafards	273	1	8	0	2021-04-17	Harry Hole	french	2
Harry Potter et le Prince de sang-mêlé	249	0	\N	0	\N	Harry Potter	french	6
Les sorceliers	53	0	\N	0	\N	Tara Duncan	french	1
Malefico	286	1	8	0	2021-12-20	Le tribunal des âmes	french	2
Ma soeur est une artiste de guerre	86	0	\N	0	\N	Les autodafeurs	french	2
Le destin d'Adhara	264	0	\N	0	\N	Légendes du monde émergé	french	1
Lune de printemps	65	0	\N	0	\N	Indiana Teller	french	1
L'impératrice maléfique	60	0	\N	0	\N	Tara Duncan	french	8
Sous les vents de Neptune	8	0	\N	0	\N	Comissaire Jean-Baptiste Adamsberg	french	4
Les chiens de Pasvik	0	1	7	0	2021-05-29	\N	french	\N
L'assassin qui est en moi	1	1	3	0	2021-05-02	\N	french	\N
Le Dernier Lapon	3	0	\N	0	\N	\N	french	\N
Le Détroit du Loup	4	0	\N	0	\N	\N	french	\N
La montagne rouge	5	0	\N	0	\N	\N	french	\N
Mission polaire	93	0	\N	0	\N	Artemis Fowl	french	2
Code éternité	94	0	\N	0	\N	Artemis Fowl	french	3
Le paradoxe du temps	97	0	\N	0	\N	Artemis Fowl	french	6
L'Ingénu	14	0	\N	0	\N	\N	french	\N
Germinal	18	0	\N	0	\N	\N	french	\N
Le collier rouge	19	0	\N	0	\N	\N	french	\N
Le complexe d'Atlantis	98	0	\N	0	\N	Artemis Fowl	french	7
L'armée furieuse	10	0	\N	0	\N	Comissaire Jean-Baptiste Adamsberg	french	7
Quand sort la recluse	12	0	\N	0	\N	Comissaire Jean-Baptiste Adamsberg	french	9
Los Angeles River	109	0	\N	0	\N	Harry Bosch	french	10
A genoux	104	0	\N	0	\N	Harry Bosch	french	13
Béhémoth	16	0	\N	0	\N	Léviathan	french	2
Le cartographe des Indes Boréales	33	0	5	0	2020-05-19	\N	french	\N
Persépolis	34	0	\N	2	\N	\N	french	\N
Le cadavre dans la Rolls	107	0	\N	0	\N	Harry Bosch	french	5
Lumière morte	110	0	\N	0	\N	Harry Bosch	french	9
Hunger games	101	0	\N	0	\N	Hunger Games	french	1
Hunger games : la révolte	103	0	\N	0	\N	Hunger Games	french	3
Lune d'été	66	0	\N	0	\N	Indiana Teller	french	2
Lune d'automne	67	0	\N	0	\N	Indiana Teller	french	3
Lune d'hiver	68	0	\N	0	\N	Indiana Teller	french	4
Le souffle de la hyène	77	0	\N	0	\N	L'Autre	french	1
Full Metal Alchimist	52	0	\N	2	\N	\N	french	\N
Goliath	17	0	\N	0	\N	Léviathan	french	3
La huitième porte	79	0	\N	0	\N	L'Autre	french	3
Opération Joshua	123	0	\N	0	\N	Opération Joshua	french	1
Léviathan	15	0	\N	0	\N	Léviathan	french	1
Nous sommes tous des propagateurs	87	0	\N	0	\N	Les autodafeurs	french	3
En attendant Godot	69	0	\N	0	\N	\N	french	\N
Marée d'équinoxe	70	0	\N	0	\N	\N	french	\N
Profanation	49	0	\N	0	\N	Les enquêtes du département V	french	2
D'un monde à l'autre	71	0	\N	0	\N	La Quête d'Ewilan	french	1
Ellana la prophétie	82	0	\N	0	\N	Le Pacte des Marchombres	french	3
Debout les morts	13	0	\N	0	\N	Les Evangélistes	french	1
La forêt des captifs	74	0	\N	0	\N	Les Mondes d'Ewilan	french	1
La Peste	83	0	\N	0	\N	\N	french	\N
L'étranger	84	0	\N	0	\N	\N	french	\N
L'oeil d'Otolep	75	0	\N	0	\N	Les Mondes d'Ewilan	french	2
Les empires nomades	88	0	\N	1	\N	\N	french	\N
Airman	89	0	\N	0	\N	\N	french	\N
Le Supernaturaliste	90	0	\N	0	\N	\N	french	\N
Les tentacules du mal	76	0	\N	0	\N	Les Mondes d'Ewilan	french	3
Dragons contre démons	62	0	\N	0	\N	Tara Duncan	french	10
Le passage de pierre	126	0	\N	0	\N	Les Nains	french	1
Mon frère est un gardien	85	0	\N	0	\N	Les autodafeurs	french	1
Délivrance	46	0	\N	0	\N	Les enquêtes du département V	french	3
L'empire d'ivoire	2	1	9	0	2021-02-06	Téméraire	french	4
L'effet papillon	48	0	\N	0	\N	Les enquêtes du département V	french	5
Créance de sang	106	0	\N	0	\N	\N	french	\N
Selfie	51	0	\N	0	\N	Les enquêtes du département V	french	7
Prédation	35	0	7	0	\N	Les voies de l'ombre	french	1
L'adulte surdoué	112	0	\N	1	\N	\N	french	\N
Les larmes d'Aral	113	0	\N	0	\N	\N	french	\N
Les carrés magiques	114	0	\N	1	\N	\N	french	\N
Les masques de sang	25	0	\N	0	\N	Les étranges soeurs Wilcox	french	3
Homo : histoire plurielle d'un genre très singulier	118	0	\N	1	\N	\N	french	\N
La guerre des planètes	63	0	\N	0	\N	Tara Duncan	french	11
Toutes blessent, la dernière tue	120	0	\N	0	\N	\N	french	\N
Block 46	121	0	\N	0	\N	\N	french	\N
Sapiens : Une brève histoire de l'humanité	122	0	\N	1	\N	\N	french	\N
Le livre interdit	54	0	\N	0	\N	Tara Duncan	french	2
Le continent interdit	57	0	\N	0	\N	Tara Duncan	french	5
Le trône de jade	42	1	8	0	2021-01-18	Téméraire	french	2
L'invasion fantome	59	0	\N	0	\N	Tara Duncan	french	7
Contre la Reine noire	61	0	\N	0	\N	Tara Duncan	french	9
Sprawlball	36	1	8	1	\N	\N	english	\N
Entre ciel et terre	116	0	\N	0	\N	Vango	french	1
Par les chemins de la soie	44	1	8	0	2021-01-26	Téméraire	french	3
Le complot du Nil	26	0	\N	0	\N	Tirya	french	1
Le trône d'Isis	28	0	\N	0	\N	Tirya	french	3
Le pharaon de l'ombre	27	0	\N	0	\N	Tirya	french	2
La fille d'Anubis	29	0	\N	0	\N	Tirya	french	4
La vengeance de la déesse	31	0	\N	0	\N	Tirya	french	6
Le triomphe des lionnes	32	0	\N	0	\N	Tirya	french	7
Les dragons de sa majesté	41	1	9	0	2021-01-13	Téméraire	french	1
Un prince sans royaume	117	0	\N	0	\N	Vango	french	2
L'assassin malgré lui	91	0	\N	0	\N	WARP	french	1
Boréal	279	1	6	0	2021-10-13	\N	french	\N
La pâle lumière des ténèbres	156	0	\N	0	\N	A comme Association	french	1
Le subtil parfum du souffre	159	0	\N	0	\N	A comme Association	french	4
Car nos coeurs sont hantés	162	0	\N	0	\N	A comme Association	french	7
Pointe blanche	289	0	\N	0	\N	Alex Rider	french	2
Arkange	293	0	\N	0	\N	Alex Rider	french	6
Le réveil de Scorpia	296	0	\N	0	\N	Alex Rider	french	9
Artemis Fowl	92	0	\N	0	\N	Artemis Fowl	french	1
Opération opale	95	0	\N	0	\N	Artemis Fowl	french	4
Colonie perdue	96	0	\N	0	\N	Artemis Fowl	french	5
Vandales	186	0	\N	0	\N	CHERUB	french	11
La vague fantôme	187	0	\N	0	\N	CHERUB	french	12
Le clan Aramov	188	0	\N	0	\N	CHERUB	french	13
Sang pour sang	180	0	\N	0	\N	CHERUB	french	6
A la dérive	181	0	\N	0	\N	CHERUB	french	7
L'héritage	209	0	\N	0	\N	Eragon	french	4
Une vérité à deux visages	111	0	\N	0	\N	Harry Bosch	french	23
L'homme chauve-souris	298	1	\N	0	\N	Harry Hole	french	1
Harry Potter et la coupe de feu	247	0	\N	0	\N	Harry Potter	french	4
Harry Potter et l'ordre du Phénix	248	0	\N	0	\N	Harry Potter	french	5
L'armée secrète	191	0	\N	0	\N	Henderson's Boys	french	3
Hunger games : l'embrasement	102	0	\N	0	\N	Hunger Games	french	2
[Mu] Le feu sacré de la Terre	20	0	\N	0	\N	La trilogie du gardien	french	1
[Zéta] Le souffle du ciel	21	0	\N	0	\N	La trilogie du gardien	french	3
Une offrande à la tempête	214	0	\N	0	\N	La vallée du Baztan	french	3
Les hommes qui n'aimaient pas les femmes	167	0	\N	0	\N	Millénium	french	1
Opération Joshua : avant la derniére heure	125	0	\N	0	\N	Opération Joshua	french	3
En attendant le jour	284	1	7	0	2021-11-17	Renée Ballard	french	1
Le sceptre maudit	55	0	\N	0	\N	Tara Duncan	french	3
Le loup des sept collines	30	0	\N	0	\N	Tirya	french	5
Ellana	80	0	\N	0	\N	Le Pacte des Marchombres	french	1
Tenebra Roma	287	1	8	0	2022-01-05	Le tribunal des âmes	french	3
La justice céleste	236	0	\N	0	\N	Les Chevaliers d'Emeraude	french	11
Piège au royaume des ombres	228	0	\N	0	\N	Les Chevaliers d'Emeraude	french	3
La princesse rebelle	229	0	\N	0	\N	Les Chevaliers d'Emeraude	french	4
Les dieux déchus	233	0	\N	0	\N	Les Chevaliers d'Emeraude	french	8
L'héritage de Danalieth	234	0	\N	0	\N	Les Chevaliers d'Emeraude	french	9
Lundi mystérieux	195	0	\N	0	\N	Les Sept Clefs du pouvoir	french	1
Stigmate	37	0	4	0	\N	Les voies de l'ombre	french	2
Dust	280	1	7	0	2021-10-13	\N	french	\N
Snakehead	294	0	\N	0	\N	Alex Rider	french	7
L'homme à l'envers	6	0	\N	0	\N	Comissaire Jean-Baptiste Adamsberg	french	2
Pars vite et reviens tard	7	0	\N	0	\N	Comissaire Jean-Baptiste Adamsberg	french	3
Dans les bois éternels	9	0	\N	0	\N	Comissaire Jean-Baptiste Adamsberg	french	5
Temps glaciaires	11	0	\N	0	\N	Comissaire Jean-Baptiste Adamsberg	french	8
Porteurs-de-peau	134	0	\N	0	\N	Enquêtes de Leaphorn et Chee	french	1
Le jour de l'aigle	190	0	\N	0	\N	Henderson's Boys	french	2
[Phi] La clé du temps	22	0	\N	0	\N	La trilogie du gardien	french	2
Le dernier sacrifice	297	0	\N	0	\N	Les étranges soeurs Wilcox	french	4
Tobie Lolness	115	0	\N	0	\N	Tobie Lolness	french	1
La victoire des aigles	43	1	7	0	2021-02-06	Téméraire	french	5
L'île du Crâne	100	0	\N	0	\N	\N	french	\N
Harry Potter et le prisonnier d'Azkaban	246	0	\N	0	\N	Harry Potter	french	3
Harry Potter et les reliques de la mort	250	0	\N	0	\N	Harry Potter	french	7
L'évasion	189	0	\N	0	\N	Henderson's Boys	french	1
Les dragons de l'empereur noir	226	0	\N	0	\N	Les Chevaliers d'Emeraude	french	2
Brisingr	208	0	\N	0	\N	Eragon	french	3
Représailles	235	0	\N	0	\N	Les Chevaliers d'Emeraude	french	10
L'enlèvement	232	0	\N	0	\N	Les Chevaliers d'Emeraude	french	7
Le journal d'Onyx	231	0	\N	0	\N	Les Chevaliers d'Emeraude	french	6
Irianeth	237	0	\N	0	\N	Les Chevaliers d'Emeraude	french	12
Sombre mardi	196	0	\N	0	\N	Les Sept Clefs du pouvoir	french	2
Phaenomen 3	155	0	\N	0	\N	Phaenomen	french	3
Atomka	251	0	\N	0	\N	Sharko & Henebelle	french	7
L'Ainé	207	0	\N	0	\N	Eragon	french	2
Abussos	242	0	\N	0	\N	Les Héritiers d'Enkidiev	french	5
Phaenomen 2	154	0	\N	0	\N	Phaenomen	french	2
Evil star	137	0	\N	0	\N	Le pouvoir des cinq	french	2
Necropolis	139	0	\N	0	\N	Le pouvoir des cinq	french	4
Là où les mots n'existent pas	160	0	\N	0	\N	A comme Association	french	5
Opération U-Boot	192	0	\N	0	\N	Henderson's Boys	french	4
Ce qui dort dans la nuit	161	0	\N	0	\N	A comme Association	french	6
Le regard br├╗lant des étoiles	163	0	\N	0	\N	A comme Association	french	8
Le secret de l'eau noire	128	0	\N	0	\N	La Guerre des nains	french	1
Le diamant de discorde	130	0	\N	0	\N	La Revanche des nains	french	1
L'étoile de l'expiation	131	0	\N	0	\N	La Revanche des nains	french	2
Les Misérables	141	0	\N	0	\N	\N	french	\N
Opération Napoléon	143	0	\N	0	\N	\N	french	\N
Le gardien invisible	213	0	\N	0	\N	La vallée du Baztan	french	1
Le mage maudit	133	0	\N	0	\N	Le Destin des nains	french	2
Le Roi se meurt	150	0	\N	0	\N	\N	french	\N
Le Marchand de sable	151	0	\N	0	\N	\N	french	\N
Naruto	152	0	\N	2	\N	\N	french	\N
Le feu dans le ciel	225	0	\N	0	\N	Les Chevaliers d'Emeraude	french	1
Nouveau monde	239	0	\N	0	\N	Les Héritiers d'Enkidiev	french	2
Perfidia	217	0	\N	0	\N	A.N.G.E.	french	3
Le retour du roi	256	0	\N	0	\N	Le Seigneur des anneaux	french	2
Discours de la servitude volontaire	164	0	\N	0	\N	\N	french	\N
Vendredi maléfique	199	0	\N	0	\N	Les Sept Clefs du pouvoir	french	5
Les deux tours	255	0	\N	0	\N	Le Seigneur des anneaux	french	3
Le passeur	170	0	\N	0	\N	\N	french	\N
Fairy Tail	171	0	\N	2	\N	\N	french	\N
Born to Run	172	0	\N	1	\N	\N	french	\N
Berserk	173	0	\N	2	\N	\N	french	\N
Lettres persanes	174	0	\N	0	\N	\N	french	\N
Raven's gate	136	0	\N	0	\N	Le pouvoir des cinq	french	1
Dimanche fatal	201	0	\N	0	\N	Les Sept Clefs du pouvoir	french	7
La reine dans le palais des courants d'air	169	0	\N	0	\N	Millénium	french	3
Ce qui ne me tue pas	165	0	\N	0	\N	Millénium	french	4
Oblivion	140	0	\N	0	\N	Le pouvoir des cinq	french	5
Le lagon noir	142	0	\N	0	\N	Erlendur Sveinsson	french	14
Le sanctuaire	241	0	\N	0	\N	Les Héritiers d'Enkidiev	french	4
La jeune fille et la nuit	193	0	\N	0	\N	\N	french	\N
Le fils	194	0	\N	0	\N	\N	french	\N
La fille qui rendait coup pour coup	166	0	\N	0	\N	Millénium	french	5
Phaenomen 1	153	0	\N	0	\N	Phaenomen	french	1
One Piece	203	0	\N	2	\N	\N	french	\N
One Punch Man	204	0	\N	2	\N	\N	french	\N
Akira	205	0	\N	2	\N	\N	french	\N
Antichristus	215	0	\N	0	\N	A.N.G.E.	french	1
L'homme invisible	210	0	\N	0	\N	\N	french	\N
Les effacés	211	0	\N	0	\N	\N	french	\N
Obscuritas	224	0	\N	0	\N	A.N.G.E.	french	10
Harry Potter et la chambre des secrets	245	0	\N	0	\N	Harry Potter	french	2
Reptilis	216	0	\N	0	\N	A.N.G.E.	french	2
Codex Angelicus	219	0	\N	0	\N	A.N.G.E.	french	5
La cité des jarres	145	0	\N	0	\N	Erlendur Sveinsson	french	3
La femme en vert	146	0	\N	0	\N	Erlendur Sveinsson	french	4
Tribulare	220	0	\N	0	\N	A.N.G.E.	french	6
Periculum	222	0	\N	0	\N	A.N.G.E.	french	8
Cenotaphium	223	0	\N	0	\N	A.N.G.E.	french	9
100 jours en enfer	175	0	\N	0	\N	CHERUB	french	1
Le grand jeu	185	0	\N	0	\N	CHERUB	french	10
Trafic	176	0	\N	0	\N	CHERUB	french	2
Dors bien cette nuit	243	0	\N	0	\N	\N	french	\N
Arizona Max	177	0	\N	0	\N	CHERUB	french	3
Chute libre	178	0	\N	0	\N	CHERUB	french	4
Les Survivants	179	0	\N	0	\N	CHERUB	french	5
Hunter X Hunter	252	0	\N	2	\N	\N	french	\N
Le Hobbit	253	0	\N	0	\N	\N	french	\N
Eragon	206	0	\N	0	\N	Eragon	french	1
Doubt	257	0	\N	2	\N	\N	french	\N
Mad Dogs	182	0	\N	0	\N	CHERUB	french	8
Soleil noir	183	0	\N	0	\N	CHERUB	french	85
Etranges rivages	149	0	\N	0	\N	Erlendur Sveinsson	french	11
Crash	184	0	\N	0	\N	CHERUB	french	9
Les fils de la poussière	144	0	\N	0	\N	Erlendur Sveinsson	french	1
Death Note	202	0	\N	2	\N	\N	english	\N
\.


 2994.dat                                                                                            0000600 0004000 0002000 00000000005 14212750305 0014253 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           2996.dat                                                                                            0000600 0004000 0002000 00000000341 14212750305 0014260 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	bookshelv	question
2	bookshelv	choice
3	admin	logentry
4	auth	permission
5	auth	group
6	auth	user
7	contenttypes	contenttype
8	sessions	session
9	bookshelv	author
10	bookshelv	base
11	bookshelv	book
12	bookshelv	owner
\.


                                                                                                                                                                                                                                                                                               2998.dat                                                                                            0000600 0004000 0002000 00000002513 14212750305 0014265 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	contenttypes	0001_initial	2021-10-16 15:16:00.239895+02
2	auth	0001_initial	2021-10-16 15:16:01.130588+02
3	admin	0001_initial	2021-10-16 15:16:01.346919+02
4	admin	0002_logentry_remove_auto_add	2021-10-16 15:16:01.346919+02
5	admin	0003_logentry_add_action_flag_choices	2021-10-16 15:16:01.362581+02
6	contenttypes	0002_remove_content_type_name	2021-10-16 15:16:01.463033+02
7	auth	0002_alter_permission_name_max_length	2021-10-16 15:16:01.478385+02
8	auth	0003_alter_user_email_max_length	2021-10-16 15:16:01.478385+02
9	auth	0004_alter_user_username_opts	2021-10-16 15:16:01.494009+02
10	auth	0005_alter_user_last_login_null	2021-10-16 15:16:01.509626+02
11	auth	0006_require_contenttypes_0002	2021-10-16 15:16:01.509626+02
12	auth	0007_alter_validators_add_error_messages	2021-10-16 15:16:01.516131+02
13	auth	0008_alter_user_username_max_length	2021-10-16 15:16:01.563313+02
14	auth	0009_alter_user_last_name_max_length	2021-10-16 15:16:01.578624+02
15	auth	0010_alter_group_name_max_length	2021-10-16 15:16:01.594244+02
16	auth	0011_update_proxy_permissions	2021-10-16 15:16:01.594244+02
17	auth	0012_alter_user_first_name_max_length	2021-10-16 15:16:01.609904+02
18	bookshelv	0001_initial	2021-10-16 15:16:01.733482+02
19	sessions	0001_initial	2021-10-16 15:16:01.917854+02
20	bookshelv	0002_auto_20211016_1620	2021-10-16 16:20:50.535926+02
\.


                                                                                                                                                                                     3000.dat                                                                                            0000600 0004000 0002000 00000000005 14212750305 0014226 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           3002.dat                                                                                            0000600 0004000 0002000 00000000005 14212750305 0014230 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000075751 14212750305 0015402 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

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

DROP DATABASE bookshelf;
--
-- Name: bookshelf; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE bookshelf WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';


ALTER DATABASE bookshelf OWNER TO postgres;

\connect bookshelf

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
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


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: author; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.author (
    id integer NOT NULL,
    firstname character varying NOT NULL,
    lastname character varying NOT NULL
);


ALTER TABLE public.author OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.author_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.author_id_seq OWNER TO postgres;

--
-- Name: author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.author_id_seq OWNED BY public.author.id;


--
-- Name: base; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.base (
    owner_id integer,
    author_id integer NOT NULL,
    book_id integer NOT NULL,
    id integer NOT NULL
);


ALTER TABLE public.base OWNER TO postgres;

--
-- Name: base_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.base_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.base_id_seq OWNER TO postgres;

--
-- Name: base_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.base_id_seq OWNED BY public.base.id;


--
-- Name: book; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.book (
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


ALTER TABLE public.book OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.book_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.book_id_seq OWNER TO postgres;

--
-- Name: book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.book_id_seq OWNED BY public.book.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
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


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: owner_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.owner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.owner_id_seq OWNER TO postgres;

--
-- Name: owner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.owner (
    id integer DEFAULT nextval('public.owner_id_seq'::regclass) NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.owner OWNER TO postgres;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: author id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author ALTER COLUMN id SET DEFAULT nextval('public.author_id_seq'::regclass);


--
-- Name: base id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base ALTER COLUMN id SET DEFAULT nextval('public.base_id_seq'::regclass);


--
-- Name: book id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book ALTER COLUMN id SET DEFAULT nextval('public.book_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.
COPY public.auth_group (id, name) FROM '$$PATH$$/2976.dat';

--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.
COPY public.auth_group_permissions (id, group_id, permission_id) FROM '$$PATH$$/2978.dat';

--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
\.
COPY public.auth_permission (id, name, content_type_id, codename) FROM '$$PATH$$/2980.dat';

--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
\.
COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM '$$PATH$$/2982.dat';

--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.
COPY public.auth_user_groups (id, user_id, group_id) FROM '$$PATH$$/2983.dat';

--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.
COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM '$$PATH$$/2986.dat';

--
-- Data for Name: author; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.author (id, firstname, lastname) FROM stdin;
\.
COPY public.author (id, firstname, lastname) FROM '$$PATH$$/2988.dat';

--
-- Data for Name: base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.base (owner_id, author_id, book_id, id) FROM stdin;
\.
COPY public.base (owner_id, author_id, book_id, id) FROM '$$PATH$$/2990.dat';

--
-- Data for Name: book; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.book (title, id, format, mark, type, date_end_reading, series, language, series_number) FROM stdin;
\.
COPY public.book (title, id, format, mark, type, date_end_reading, series, language, series_number) FROM '$$PATH$$/2992.dat';

--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.
COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM '$$PATH$$/2994.dat';

--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
\.
COPY public.django_content_type (id, app_label, model) FROM '$$PATH$$/2996.dat';

--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
\.
COPY public.django_migrations (id, app, name, applied) FROM '$$PATH$$/2998.dat';

--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.
COPY public.django_session (session_key, session_data, expire_date) FROM '$$PATH$$/3000.dat';

--
-- Data for Name: owner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.owner (id, name) FROM stdin;
\.
COPY public.owner (id, name) FROM '$$PATH$$/3002.dat';

--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 1, false);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, false);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.author_id_seq', 1, false);


--
-- Name: base_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.base_id_seq', 1, false);


--
-- Name: book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.book_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 1, false);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 1, false);


--
-- Name: owner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.owner_id_seq', 1, false);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: author author_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.author
    ADD CONSTRAINT author_pk PRIMARY KEY (id);


--
-- Name: base base_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_pkey PRIMARY KEY (id);


--
-- Name: book book_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.book
    ADD CONSTRAINT book_pk PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: owner o_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.owner
    ADD CONSTRAINT o_pk PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: author_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX author_id_uindex ON public.author USING btree (id);


--
-- Name: book_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX book_id_uindex ON public.book USING btree (id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: owner_name_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX owner_name_uindex ON public.owner USING btree (name);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: base base_author_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_author_id_fk FOREIGN KEY (author_id) REFERENCES public.author(id);


--
-- Name: base base_book_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_book_id_fk FOREIGN KEY (book_id) REFERENCES public.book(id);


--
-- Name: base base_owner_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.base
    ADD CONSTRAINT base_owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.owner(id);


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       