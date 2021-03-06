PGDMP     *        	            z         
   EpicEvents    14.3    14.3 ?    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ?           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            ?           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    18348 
   EpicEvents    DATABASE     h   CREATE DATABASE "EpicEvents" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Japanese_Japan.932';
    DROP DATABASE "EpicEvents";
                postgres    false            ?            1259    18491 
   api_client    TABLE     ?  CREATE TABLE public.api_client (
    id bigint NOT NULL,
    email character varying(100) NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    phone character varying(20) NOT NULL,
    mobile character varying(20) NOT NULL,
    company_name character varying(250) NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    sales_contact_id bigint NOT NULL
);
    DROP TABLE public.api_client;
       public         heap    postgres    false            ?            1259    18490    api_client_id_seq    SEQUENCE     z   CREATE SEQUENCE public.api_client_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.api_client_id_seq;
       public          postgres    false    228            ?           0    0    api_client_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.api_client_id_seq OWNED BY public.api_client.id;
          public          postgres    false    227            ?            1259    18500    api_contract    TABLE     C  CREATE TABLE public.api_contract (
    id bigint NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    amount double precision NOT NULL,
    payment_due timestamp with time zone NOT NULL,
    client_id bigint NOT NULL,
    sales_contact_id bigint NOT NULL
);
     DROP TABLE public.api_contract;
       public         heap    postgres    false            ?            1259    18499    api_contract_id_seq    SEQUENCE     |   CREATE SEQUENCE public.api_contract_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.api_contract_id_seq;
       public          postgres    false    230            ?           0    0    api_contract_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.api_contract_id_seq OWNED BY public.api_contract.id;
          public          postgres    false    229            ?            1259    18506    api_contractstatus    TABLE     w   CREATE TABLE public.api_contractstatus (
    contract_id bigint NOT NULL,
    status character varying(20) NOT NULL
);
 &   DROP TABLE public.api_contractstatus;
       public         heap    postgres    false            ?            1259    18512 	   api_event    TABLE     ?  CREATE TABLE public.api_event (
    id bigint NOT NULL,
    date_created timestamp with time zone NOT NULL,
    date_updated timestamp with time zone NOT NULL,
    event_status character varying(32) NOT NULL,
    event_date timestamp with time zone NOT NULL,
    notes character varying(250) NOT NULL,
    client_id bigint NOT NULL,
    support_contact_id bigint NOT NULL,
    contract_id bigint
);
    DROP TABLE public.api_event;
       public         heap    postgres    false            ?            1259    18511    api_event_id_seq    SEQUENCE     y   CREATE SEQUENCE public.api_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.api_event_id_seq;
       public          postgres    false    233            ?           0    0    api_event_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.api_event_id_seq OWNED BY public.api_event.id;
          public          postgres    false    232            ?            1259    18375 
   auth_group    TABLE     f   CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);
    DROP TABLE public.auth_group;
       public         heap    postgres    false            ?            1259    18374    auth_group_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.auth_group_id_seq;
       public          postgres    false    216            ?           0    0    auth_group_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;
          public          postgres    false    215            ?            1259    18384    auth_group_permissions    TABLE     ?   CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);
 *   DROP TABLE public.auth_group_permissions;
       public         heap    postgres    false            ?            1259    18383    auth_group_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.auth_group_permissions_id_seq;
       public          postgres    false    218            ?           0    0    auth_group_permissions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;
          public          postgres    false    217            ?            1259    18368    auth_permission    TABLE     ?   CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);
 #   DROP TABLE public.auth_permission;
       public         heap    postgres    false            ?            1259    18367    auth_permission_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.auth_permission_id_seq;
       public          postgres    false    214            ?           0    0    auth_permission_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;
          public          postgres    false    213            ?            1259    18417    authentication_user    TABLE       CREATE TABLE public.authentication_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(100) NOT NULL,
    username character varying(100) NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    role character varying(32) NOT NULL
);
 '   DROP TABLE public.authentication_user;
       public         heap    postgres    false            ?            1259    18426    authentication_user_groups    TABLE     ?   CREATE TABLE public.authentication_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);
 .   DROP TABLE public.authentication_user_groups;
       public         heap    postgres    false            ?            1259    18425 !   authentication_user_groups_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.authentication_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.authentication_user_groups_id_seq;
       public          postgres    false    222            ?           0    0 !   authentication_user_groups_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.authentication_user_groups_id_seq OWNED BY public.authentication_user_groups.id;
          public          postgres    false    221            ?            1259    18416    authentication_user_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.authentication_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.authentication_user_id_seq;
       public          postgres    false    220            ?           0    0    authentication_user_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.authentication_user_id_seq OWNED BY public.authentication_user.id;
          public          postgres    false    219            ?            1259    18433 $   authentication_user_user_permissions    TABLE     ?   CREATE TABLE public.authentication_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);
 8   DROP TABLE public.authentication_user_user_permissions;
       public         heap    postgres    false            ?            1259    18432 +   authentication_user_user_permissions_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.authentication_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.authentication_user_user_permissions_id_seq;
       public          postgres    false    224            ?           0    0 +   authentication_user_user_permissions_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.authentication_user_user_permissions_id_seq OWNED BY public.authentication_user_user_permissions.id;
          public          postgres    false    223            ?            1259    18469    django_admin_log    TABLE     ?  CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);
 $   DROP TABLE public.django_admin_log;
       public         heap    postgres    false            ?            1259    18468    django_admin_log_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.django_admin_log_id_seq;
       public          postgres    false    226            ?           0    0    django_admin_log_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;
          public          postgres    false    225            ?            1259    18359    django_content_type    TABLE     ?   CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);
 '   DROP TABLE public.django_content_type;
       public         heap    postgres    false            ?            1259    18358    django_content_type_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.django_content_type_id_seq;
       public          postgres    false    212            ?           0    0    django_content_type_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;
          public          postgres    false    211            ?            1259    18350    django_migrations    TABLE     ?   CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);
 %   DROP TABLE public.django_migrations;
       public         heap    postgres    false            ?            1259    18349    django_migrations_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.django_migrations_id_seq;
       public          postgres    false    210            ?           0    0    django_migrations_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;
          public          postgres    false    209            ?            1259    18561    django_session    TABLE     ?   CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);
 "   DROP TABLE public.django_session;
       public         heap    postgres    false            ?           2604    18494    api_client id    DEFAULT     n   ALTER TABLE ONLY public.api_client ALTER COLUMN id SET DEFAULT nextval('public.api_client_id_seq'::regclass);
 <   ALTER TABLE public.api_client ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            ?           2604    18503    api_contract id    DEFAULT     r   ALTER TABLE ONLY public.api_contract ALTER COLUMN id SET DEFAULT nextval('public.api_contract_id_seq'::regclass);
 >   ALTER TABLE public.api_contract ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            ?           2604    18515    api_event id    DEFAULT     l   ALTER TABLE ONLY public.api_event ALTER COLUMN id SET DEFAULT nextval('public.api_event_id_seq'::regclass);
 ;   ALTER TABLE public.api_event ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    232    233    233            ?           2604    18378    auth_group id    DEFAULT     n   ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);
 <   ALTER TABLE public.auth_group ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            ?           2604    18387    auth_group_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);
 H   ALTER TABLE public.auth_group_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            ?           2604    18371    auth_permission id    DEFAULT     x   ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);
 A   ALTER TABLE public.auth_permission ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            ?           2604    18420    authentication_user id    DEFAULT     ?   ALTER TABLE ONLY public.authentication_user ALTER COLUMN id SET DEFAULT nextval('public.authentication_user_id_seq'::regclass);
 E   ALTER TABLE public.authentication_user ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            ?           2604    18429    authentication_user_groups id    DEFAULT     ?   ALTER TABLE ONLY public.authentication_user_groups ALTER COLUMN id SET DEFAULT nextval('public.authentication_user_groups_id_seq'::regclass);
 L   ALTER TABLE public.authentication_user_groups ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            ?           2604    18436 '   authentication_user_user_permissions id    DEFAULT     ?   ALTER TABLE ONLY public.authentication_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.authentication_user_user_permissions_id_seq'::regclass);
 V   ALTER TABLE public.authentication_user_user_permissions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            ?           2604    18472    django_admin_log id    DEFAULT     z   ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);
 B   ALTER TABLE public.django_admin_log ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            ?           2604    18362    django_content_type id    DEFAULT     ?   ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);
 E   ALTER TABLE public.django_content_type ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    211    212    212            ?           2604    18353    django_migrations id    DEFAULT     |   ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);
 C   ALTER TABLE public.django_migrations ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    210    209    210            ?          0    18491 
   api_client 
   TABLE DATA           ?   COPY public.api_client (id, email, first_name, last_name, phone, mobile, company_name, date_created, date_updated, sales_contact_id) FROM stdin;
    public          postgres    false    228   e?       ?          0    18500    api_contract 
   TABLE DATA           x   COPY public.api_contract (id, date_created, date_updated, amount, payment_due, client_id, sales_contact_id) FROM stdin;
    public          postgres    false    230   $?       ?          0    18506    api_contractstatus 
   TABLE DATA           A   COPY public.api_contractstatus (contract_id, status) FROM stdin;
    public          postgres    false    231   ??       ?          0    18512 	   api_event 
   TABLE DATA           ?   COPY public.api_event (id, date_created, date_updated, event_status, event_date, notes, client_id, support_contact_id, contract_id) FROM stdin;
    public          postgres    false    233   ѿ       ?          0    18375 
   auth_group 
   TABLE DATA           .   COPY public.auth_group (id, name) FROM stdin;
    public          postgres    false    216   ??       ?          0    18384    auth_group_permissions 
   TABLE DATA           M   COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
    public          postgres    false    218   ??       ?          0    18368    auth_permission 
   TABLE DATA           N   COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
    public          postgres    false    214   V?       ?          0    18417    authentication_user 
   TABLE DATA           ?   COPY public.authentication_user (id, password, last_login, is_superuser, is_staff, is_active, date_joined, email, username, first_name, last_name, role) FROM stdin;
    public          postgres    false    220   ??       ?          0    18426    authentication_user_groups 
   TABLE DATA           K   COPY public.authentication_user_groups (id, user_id, group_id) FROM stdin;
    public          postgres    false    222   ??       ?          0    18433 $   authentication_user_user_permissions 
   TABLE DATA           Z   COPY public.authentication_user_user_permissions (id, user_id, permission_id) FROM stdin;
    public          postgres    false    224   ??       ?          0    18469    django_admin_log 
   TABLE DATA           ?   COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
    public          postgres    false    226   ??       ?          0    18359    django_content_type 
   TABLE DATA           C   COPY public.django_content_type (id, app_label, model) FROM stdin;
    public          postgres    false    212   ??       ?          0    18350    django_migrations 
   TABLE DATA           C   COPY public.django_migrations (id, app, name, applied) FROM stdin;
    public          postgres    false    210   C?       ?          0    18561    django_session 
   TABLE DATA           P   COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
    public          postgres    false    234   ??       ?           0    0    api_client_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.api_client_id_seq', 3, true);
          public          postgres    false    227            ?           0    0    api_contract_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.api_contract_id_seq', 3, true);
          public          postgres    false    229            ?           0    0    api_event_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.api_event_id_seq', 12, true);
          public          postgres    false    232            ?           0    0    auth_group_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.auth_group_id_seq', 3, true);
          public          postgres    false    215            ?           0    0    auth_group_permissions_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 32, true);
          public          postgres    false    217            ?           0    0    auth_permission_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.auth_permission_id_seq', 40, true);
          public          postgres    false    213            ?           0    0 !   authentication_user_groups_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.authentication_user_groups_id_seq', 9, true);
          public          postgres    false    221            ?           0    0    authentication_user_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.authentication_user_id_seq', 10, true);
          public          postgres    false    219            ?           0    0 +   authentication_user_user_permissions_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.authentication_user_user_permissions_id_seq', 1, false);
          public          postgres    false    223            ?           0    0    django_admin_log_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.django_admin_log_id_seq', 31, true);
          public          postgres    false    225            ?           0    0    django_content_type_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.django_content_type_id_seq', 10, true);
          public          postgres    false    211            ?           0    0    django_migrations_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);
          public          postgres    false    209            ?           2606    18498    api_client api_client_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.api_client
    ADD CONSTRAINT api_client_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.api_client DROP CONSTRAINT api_client_email_key;
       public            postgres    false    228            ?           2606    18496    api_client api_client_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.api_client
    ADD CONSTRAINT api_client_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.api_client DROP CONSTRAINT api_client_pkey;
       public            postgres    false    228            ?           2606    18505    api_contract api_contract_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.api_contract
    ADD CONSTRAINT api_contract_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.api_contract DROP CONSTRAINT api_contract_pkey;
       public            postgres    false    230            ?           2606    18510 *   api_contractstatus api_contractstatus_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.api_contractstatus
    ADD CONSTRAINT api_contractstatus_pkey PRIMARY KEY (contract_id);
 T   ALTER TABLE ONLY public.api_contractstatus DROP CONSTRAINT api_contractstatus_pkey;
       public            postgres    false    231            ?           2606    18586 -   api_event api_event_contract_id_2bff2191_uniq 
   CONSTRAINT     o   ALTER TABLE ONLY public.api_event
    ADD CONSTRAINT api_event_contract_id_2bff2191_uniq UNIQUE (contract_id);
 W   ALTER TABLE ONLY public.api_event DROP CONSTRAINT api_event_contract_id_2bff2191_uniq;
       public            postgres    false    233            ?           2606    18517    api_event api_event_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.api_event
    ADD CONSTRAINT api_event_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.api_event DROP CONSTRAINT api_event_pkey;
       public            postgres    false    233            ?           2606    18414    auth_group auth_group_name_key 
   CONSTRAINT     Y   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);
 H   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_name_key;
       public            postgres    false    216            ?           2606    18400 R   auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);
 |   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
       public            postgres    false    218    218            ?           2606    18389 2   auth_group_permissions auth_group_permissions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_pkey;
       public            postgres    false    218            ?           2606    18380    auth_group auth_group_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.auth_group DROP CONSTRAINT auth_group_pkey;
       public            postgres    false    216            ?           2606    18391 F   auth_permission auth_permission_content_type_id_codename_01ab375a_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);
 p   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq;
       public            postgres    false    214    214            ?           2606    18373 $   auth_permission auth_permission_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_pkey;
       public            postgres    false    214            ?           2606    18424 1   authentication_user authentication_user_email_key 
   CONSTRAINT     m   ALTER TABLE ONLY public.authentication_user
    ADD CONSTRAINT authentication_user_email_key UNIQUE (email);
 [   ALTER TABLE ONLY public.authentication_user DROP CONSTRAINT authentication_user_email_key;
       public            postgres    false    220            ?           2606    18431 :   authentication_user_groups authentication_user_groups_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.authentication_user_groups
    ADD CONSTRAINT authentication_user_groups_pkey PRIMARY KEY (id);
 d   ALTER TABLE ONLY public.authentication_user_groups DROP CONSTRAINT authentication_user_groups_pkey;
       public            postgres    false    222            ?           2606    18441 T   authentication_user_groups authentication_user_groups_user_id_group_id_8af031ac_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.authentication_user_groups
    ADD CONSTRAINT authentication_user_groups_user_id_group_id_8af031ac_uniq UNIQUE (user_id, group_id);
 ~   ALTER TABLE ONLY public.authentication_user_groups DROP CONSTRAINT authentication_user_groups_user_id_group_id_8af031ac_uniq;
       public            postgres    false    222    222            ?           2606    18422 ,   authentication_user authentication_user_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.authentication_user
    ADD CONSTRAINT authentication_user_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.authentication_user DROP CONSTRAINT authentication_user_pkey;
       public            postgres    false    220            ?           2606    18438 N   authentication_user_user_permissions authentication_user_user_permissions_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.authentication_user_user_permissions
    ADD CONSTRAINT authentication_user_user_permissions_pkey PRIMARY KEY (id);
 x   ALTER TABLE ONLY public.authentication_user_user_permissions DROP CONSTRAINT authentication_user_user_permissions_pkey;
       public            postgres    false    224            ?           2606    18455 a   authentication_user_user_permissions authentication_user_user_user_id_permission_id_ec51b09f_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.authentication_user_user_permissions
    ADD CONSTRAINT authentication_user_user_user_id_permission_id_ec51b09f_uniq UNIQUE (user_id, permission_id);
 ?   ALTER TABLE ONLY public.authentication_user_user_permissions DROP CONSTRAINT authentication_user_user_user_id_permission_id_ec51b09f_uniq;
       public            postgres    false    224    224            ?           2606    18477 &   django_admin_log django_admin_log_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_pkey;
       public            postgres    false    226            ?           2606    18366 E   django_content_type django_content_type_app_label_model_76bd3d3b_uniq 
   CONSTRAINT     ?   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);
 o   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq;
       public            postgres    false    212    212            ?           2606    18364 ,   django_content_type django_content_type_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.django_content_type DROP CONSTRAINT django_content_type_pkey;
       public            postgres    false    212            ?           2606    18357 (   django_migrations django_migrations_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.django_migrations DROP CONSTRAINT django_migrations_pkey;
       public            postgres    false    210            ?           2606    18567 "   django_session django_session_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);
 L   ALTER TABLE ONLY public.django_session DROP CONSTRAINT django_session_pkey;
       public            postgres    false    234            ?           1259    18520    api_client_email_8c8b4faf_like    INDEX     j   CREATE INDEX api_client_email_8c8b4faf_like ON public.api_client USING btree (email varchar_pattern_ops);
 2   DROP INDEX public.api_client_email_8c8b4faf_like;
       public            postgres    false    228            ?           1259    18560 $   api_client_sales_contact_id_1074dc86    INDEX     g   CREATE INDEX api_client_sales_contact_id_1074dc86 ON public.api_client USING btree (sales_contact_id);
 8   DROP INDEX public.api_client_sales_contact_id_1074dc86;
       public            postgres    false    228            ?           1259    18558    api_contract_client_id_56101e55    INDEX     ]   CREATE INDEX api_contract_client_id_56101e55 ON public.api_contract USING btree (client_id);
 3   DROP INDEX public.api_contract_client_id_56101e55;
       public            postgres    false    230            ?           1259    18559 &   api_contract_sales_contact_id_02e48c3b    INDEX     k   CREATE INDEX api_contract_sales_contact_id_02e48c3b ON public.api_contract USING btree (sales_contact_id);
 :   DROP INDEX public.api_contract_sales_contact_id_02e48c3b;
       public            postgres    false    230            ?           1259    18536    api_event_client_id_77e72d31    INDEX     W   CREATE INDEX api_event_client_id_77e72d31 ON public.api_event USING btree (client_id);
 0   DROP INDEX public.api_event_client_id_77e72d31;
       public            postgres    false    233            ?           1259    18557 %   api_event_support_contact_id_95ccdaeb    INDEX     i   CREATE INDEX api_event_support_contact_id_95ccdaeb ON public.api_event USING btree (support_contact_id);
 9   DROP INDEX public.api_event_support_contact_id_95ccdaeb;
       public            postgres    false    233            ?           1259    18415    auth_group_name_a6ea08ec_like    INDEX     h   CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);
 1   DROP INDEX public.auth_group_name_a6ea08ec_like;
       public            postgres    false    216            ?           1259    18411 (   auth_group_permissions_group_id_b120cbf9    INDEX     o   CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);
 <   DROP INDEX public.auth_group_permissions_group_id_b120cbf9;
       public            postgres    false    218            ?           1259    18412 -   auth_group_permissions_permission_id_84c5c92e    INDEX     y   CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);
 A   DROP INDEX public.auth_group_permissions_permission_id_84c5c92e;
       public            postgres    false    218            ?           1259    18397 (   auth_permission_content_type_id_2f476e4b    INDEX     o   CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);
 <   DROP INDEX public.auth_permission_content_type_id_2f476e4b;
       public            postgres    false    214            ?           1259    18439 '   authentication_user_email_2220eff5_like    INDEX     |   CREATE INDEX authentication_user_email_2220eff5_like ON public.authentication_user USING btree (email varchar_pattern_ops);
 ;   DROP INDEX public.authentication_user_email_2220eff5_like;
       public            postgres    false    220            ?           1259    18453 ,   authentication_user_groups_group_id_6b5c44b7    INDEX     w   CREATE INDEX authentication_user_groups_group_id_6b5c44b7 ON public.authentication_user_groups USING btree (group_id);
 @   DROP INDEX public.authentication_user_groups_group_id_6b5c44b7;
       public            postgres    false    222            ?           1259    18452 +   authentication_user_groups_user_id_30868577    INDEX     u   CREATE INDEX authentication_user_groups_user_id_30868577 ON public.authentication_user_groups USING btree (user_id);
 ?   DROP INDEX public.authentication_user_groups_user_id_30868577;
       public            postgres    false    222            ?           1259    18467 ;   authentication_user_user_permissions_permission_id_ea6be19a    INDEX     ?   CREATE INDEX authentication_user_user_permissions_permission_id_ea6be19a ON public.authentication_user_user_permissions USING btree (permission_id);
 O   DROP INDEX public.authentication_user_user_permissions_permission_id_ea6be19a;
       public            postgres    false    224            ?           1259    18466 5   authentication_user_user_permissions_user_id_736ebf7e    INDEX     ?   CREATE INDEX authentication_user_user_permissions_user_id_736ebf7e ON public.authentication_user_user_permissions USING btree (user_id);
 I   DROP INDEX public.authentication_user_user_permissions_user_id_736ebf7e;
       public            postgres    false    224            ?           1259    18488 )   django_admin_log_content_type_id_c4bce8eb    INDEX     q   CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);
 =   DROP INDEX public.django_admin_log_content_type_id_c4bce8eb;
       public            postgres    false    226            ?           1259    18489 !   django_admin_log_user_id_c564eba6    INDEX     a   CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);
 5   DROP INDEX public.django_admin_log_user_id_c564eba6;
       public            postgres    false    226            ?           1259    18569 #   django_session_expire_date_a5c62663    INDEX     e   CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);
 7   DROP INDEX public.django_session_expire_date_a5c62663;
       public            postgres    false    234            ?           1259    18568 (   django_session_session_key_c0390e0f_like    INDEX     ~   CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);
 <   DROP INDEX public.django_session_session_key_c0390e0f_like;
       public            postgres    false    234            ?           2606    18552 I   api_client api_client_sales_contact_id_1074dc86_fk_authentication_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.api_client
    ADD CONSTRAINT api_client_sales_contact_id_1074dc86_fk_authentication_user_id FOREIGN KEY (sales_contact_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.api_client DROP CONSTRAINT api_client_sales_contact_id_1074dc86_fk_authentication_user_id;
       public          postgres    false    3266    220    228            ?           2606    18542 =   api_contract api_contract_client_id_56101e55_fk_api_client_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.api_contract
    ADD CONSTRAINT api_contract_client_id_56101e55_fk_api_client_id FOREIGN KEY (client_id) REFERENCES public.api_client(id) DEFERRABLE INITIALLY DEFERRED;
 g   ALTER TABLE ONLY public.api_contract DROP CONSTRAINT api_contract_client_id_56101e55_fk_api_client_id;
       public          postgres    false    228    230    3287            ?           2606    18547 @   api_contract api_contract_sales_contact_id_02e48c3b_fk_authentic    FK CONSTRAINT     ?   ALTER TABLE ONLY public.api_contract
    ADD CONSTRAINT api_contract_sales_contact_id_02e48c3b_fk_authentic FOREIGN KEY (sales_contact_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;
 j   ALTER TABLE ONLY public.api_contract DROP CONSTRAINT api_contract_sales_contact_id_02e48c3b_fk_authentic;
       public          postgres    false    230    220    3266            ?           2606    18521 M   api_contractstatus api_contractstatus_contract_id_716247a5_fk_api_contract_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.api_contractstatus
    ADD CONSTRAINT api_contractstatus_contract_id_716247a5_fk_api_contract_id FOREIGN KEY (contract_id) REFERENCES public.api_contract(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.api_contractstatus DROP CONSTRAINT api_contractstatus_contract_id_716247a5_fk_api_contract_id;
       public          postgres    false    3291    231    230            ?           2606    18526 7   api_event api_event_client_id_77e72d31_fk_api_client_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.api_event
    ADD CONSTRAINT api_event_client_id_77e72d31_fk_api_client_id FOREIGN KEY (client_id) REFERENCES public.api_client(id) DEFERRABLE INITIALLY DEFERRED;
 a   ALTER TABLE ONLY public.api_event DROP CONSTRAINT api_event_client_id_77e72d31_fk_api_client_id;
       public          postgres    false    228    3287    233            ?           2606    18587 ;   api_event api_event_contract_id_2bff2191_fk_api_contract_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.api_event
    ADD CONSTRAINT api_event_contract_id_2bff2191_fk_api_contract_id FOREIGN KEY (contract_id) REFERENCES public.api_contract(id) DEFERRABLE INITIALLY DEFERRED;
 e   ALTER TABLE ONLY public.api_event DROP CONSTRAINT api_event_contract_id_2bff2191_fk_api_contract_id;
       public          postgres    false    3291    233    230            ?           2606    18537 I   api_event api_event_support_contact_id_95ccdaeb_fk_authentication_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.api_event
    ADD CONSTRAINT api_event_support_contact_id_95ccdaeb_fk_authentication_user_id FOREIGN KEY (support_contact_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;
 s   ALTER TABLE ONLY public.api_event DROP CONSTRAINT api_event_support_contact_id_95ccdaeb_fk_authentication_user_id;
       public          postgres    false    233    3266    220            ?           2606    18406 O   auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 y   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
       public          postgres    false    214    3250    218            ?           2606    18401 P   auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 z   ALTER TABLE ONLY public.auth_group_permissions DROP CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
       public          postgres    false    216    3255    218            ?           2606    18392 E   auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 o   ALTER TABLE ONLY public.auth_permission DROP CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co;
       public          postgres    false    3245    212    214            ?           2606    18461 ]   authentication_user_user_permissions authentication_user__permission_id_ea6be19a_fk_auth_perm    FK CONSTRAINT     ?   ALTER TABLE ONLY public.authentication_user_user_permissions
    ADD CONSTRAINT authentication_user__permission_id_ea6be19a_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.authentication_user_user_permissions DROP CONSTRAINT authentication_user__permission_id_ea6be19a_fk_auth_perm;
       public          postgres    false    3250    224    214            ?           2606    18442 M   authentication_user_groups authentication_user__user_id_30868577_fk_authentic    FK CONSTRAINT     ?   ALTER TABLE ONLY public.authentication_user_groups
    ADD CONSTRAINT authentication_user__user_id_30868577_fk_authentic FOREIGN KEY (user_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;
 w   ALTER TABLE ONLY public.authentication_user_groups DROP CONSTRAINT authentication_user__user_id_30868577_fk_authentic;
       public          postgres    false    222    220    3266            ?           2606    18456 W   authentication_user_user_permissions authentication_user__user_id_736ebf7e_fk_authentic    FK CONSTRAINT     ?   ALTER TABLE ONLY public.authentication_user_user_permissions
    ADD CONSTRAINT authentication_user__user_id_736ebf7e_fk_authentic FOREIGN KEY (user_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.authentication_user_user_permissions DROP CONSTRAINT authentication_user__user_id_736ebf7e_fk_authentic;
       public          postgres    false    224    3266    220            ?           2606    18447 X   authentication_user_groups authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.authentication_user_groups
    ADD CONSTRAINT authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;
 ?   ALTER TABLE ONLY public.authentication_user_groups DROP CONSTRAINT authentication_user_groups_group_id_6b5c44b7_fk_auth_group_id;
       public          postgres    false    222    3255    216            ?           2606    18478 G   django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;
 q   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co;
       public          postgres    false    212    3245    226            ?           2606    18483 L   django_admin_log django_admin_log_user_id_c564eba6_fk_authentication_user_id    FK CONSTRAINT     ?   ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_authentication_user_id FOREIGN KEY (user_id) REFERENCES public.authentication_user(id) DEFERRABLE INITIALLY DEFERRED;
 v   ALTER TABLE ONLY public.django_admin_log DROP CONSTRAINT django_admin_log_user_id_c564eba6_fk_authentication_user_id;
       public          postgres    false    226    3266    220            ?   ?   x??ϱ
?0????ݥ?ri???P']:?hT??Ԋ??&(*??q???q8??????2d??`,??$r?ta ???9??w筻'kg??(E??HД?afh?e??????F?z?Cb4F??-?????I}??,????r????????.?J?3*?*?x?l?1???Y?      ?   m   x???1!k?
???? xK???)??;˕?3ZO?TE?1p???̱?Q?hh?)q??qd?F=?C????vZ??2u?s??S???GK!??$Sػ??ar/?      ?       x?3??L?KM?2?1?9??K??=... ??	?      ?   ?   x?????0???)??D??I???eb??*`?e?x~R!A*y?????Y? K?B?LT?@i???s????I=?/???_?go8???0vJ???!?&D?(?5?[f+dx?>??~4??S?jź??r<\E!l?|1X$?ٌ???PP??f,?֙|??:ĸfn?M}?򯾶ѭ?Z???Y?      ?   )   x?3??M?KLO-?2?N?I-?2?.-(?/*?????? ??	(      ?   {   x???D!Cѵ)f?	???ￎ!??Bx98B?	?I??X?`??ir???6@??]??R?n??/6?3??,???&4??h???*??*m?/[жz??????nĴ????DOy?????"C      ?   ?  x?e?Qn?0???Sp??I(-ϻƤ	ѨCꠂЩ?8?c?7lV????ٍUw?U??^?1?oe?Vo5????t??*?2? ?????? ??'????3?=??;,?0?ʂZn???	?{?~?EA?^?? ??q-Y??i}*???͉˥9z!b?SBP?U 8vd?Oc??]?O?j???Ѧ?:?V??s??GE?7Y???W??^||?g?J?+??z?rǌ?^??)?e?1d?.~V???ڊ/ ?(?|P!,?8??Ü??1loH]??A???8???&(?B,ԄīA?Y??>?+?h/?;?!B?(??L?,9?26?Qd"?f???.?????!?r??M[??˭B=m5??q?????_?5l??!??ND? TFF???L?BO???ׇ???!	      ?   z  x?}?[??<?k??wdz?0?&+??(???MހE??:?~?C6???6M?z?kҖ?^????:vf	?K#D%=؅(H????x9%?1K?j??A??r???K?>c'?5?o??N%?Mq[܌??4 ?h???h?	1?Ab????k???=?}B?9??????$??>Sa??-.s?yOl?????>?
֩"3?DO?U*???;ѝ?]?????tJ#p?S?9	???Η?)?2???[??????)b,po????(??_MP7????I??IouI>?𾼲?y???6?6Vѩi9B)??[z?#?p"/????????3&?a?-?~???I?C9?8]????????C?
;9ur?a"W?XesB????l???cm???ďΨΪ??s??9I??Gr?P?????9???k9?/?6??7B͗? ?.???"?/?Iw2?d:?oe?h??? ??G>^4??Vt&?w?#9?? ??ൻ꫋??6????M?g??7?j~?n6ژ?,P$f?"L?v{?G?In?N??X???dV-I.:??d??:i?;k???
b????|#?k2w?<??V?=?/???A???(tQ??n5?4M7vֱa?8%g@d?4#???)ؽnl?!??̱4?????73?6???ˆKJ???????k???8"h??Y4 ?h?g?=M??$:?(Q1M????G?(r?o???0s????k?ۢ8T????I???C?Y???v??DUk639??6,?s?%^?4?ۘM?ZӥC?Y3[y??CU?	?Go???|?/v??h?a??????|?3?}??>??0?hk2h?r?^??G??x?ګ???M<ح??b#8t????????Gx (^?????~??????B?.?      ?   3   x???  ????$????#I()[;??&?.??J?k/??k?>?Q      ?      x?????? ? ?      ?   ?  x???[k?@???_?詡Ͳ3?W=?R(
?[??V.%?`Ʌ???w??K-?Nb?&??|??3g	*?seΑ?r?V?rR?1߫?@?5_??ņ????|>/?i&????J`?]=???\е?i?P???k??o8%??z??T???7????:??El>VEY??j??q??]????қ??a^??U:???QVy?-?"??Ym?ez]?,?? ?H?	????<?g?<???qW?x4????3 5?$e}?#???4??i??l???e?yi(???"m$'Auq?V???2??Hf􁠤?Z??Ͱ??'t7?Z???dZ?X??ǅ??? epHZ???Ų????Y%ށ:;J?X-?M>?"???}i,?6??}Fx;?t>3$?v??[??@??}????؉??ׅ?@? ?<??r]Hȴ?? C0vO?W????¼?^{o????to?>t ?2?2 )?Z?[մ?0<?;?7???D/:?]k?pI:Xro??'????J[K?U????\5?[????o??Q}?}??[?Y?+?p2??p~?E?t???d??????ɗ??R\??}0?9?:O?>?D?ؾ?/?b?/?2_?Wl??_[ 1???v+?{?W?ۅn?b?'2??N??z?$?*x'??p??!U'<9c`,?>??v?????C??է?? 懜L&?].X      ?   |   x?U?K?0Dמ? ʟ????U,?I;H?}C*$?????@??5ҔF?^???(K??LS?qKƒjƉB?ަ?d?_??L?a??????P5)?g?0i+p۠?)??4g??a?Sy???
??>F      ?   P  x????n? ??????U#f c?,+!????vԼ?8?٭[G?)?|0gc8?}7?n?n??10???????/?1U??}?Z??7?G??D\?_??/??b:ۺMT!GQ?`??m??,$/?B?
4??\0??G?wiG??Ӹ?B??Di %W???????٧HU&J?R?#%>?q?a7?????"?#???d??⩰??6F3)?s?+??n??>??H}2ѲoJ(ze??A???g;?a4?|6.?>?֍???o?d??4`+?ܴf?c??? ????8?
Q+?P?Q???K???9??X0kr?<?E????=???VK?`?2?cU?><[??[???????k;??;w
?	$?<?(?????A,?2@}j0????<?,}?6?c???'?Bb?l?0????????V?"LPX??Pz?_???x2YV?ϊR"OAD8????ݍ?9??$üQ?4??d???*?O.e%??QN?y˳Zd???
!??B'?Qd???
??8K????b??$?P?BJ\?E??iR7>??m???????r?h?;????C@??S4?KU?&O?|>3?[???D?hTK?????_??`      ?   Z  x????n?0  ????}??"??X???&Yb +3(????^???|?i]]?7?2֝??aSp?????u????)?		??:???@?i?l??C0ϵ?2;?W|=H?T?\??fg~?zoL?_?Mme?}?V*??????]???d???w%?a?????i??n??eEP????????c????ē?ĵ??x?M?*????<??L?$?-?Q?GP?3a%?Gx?ҴM(/?4???qGn?/@? ?????M ???W`,(?^??s`3??=???????????ܾE!"??;?ֲ,?|TJ?N.	?؋?3??Ji?O?J???Hס?[??\,?+_??     