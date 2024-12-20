PGDMP      -            
    |            assessment-DB    16.2    16.2 +    +           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            ,           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            -           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            .           1262    20534    assessment-DB    DATABASE     q   CREATE DATABASE "assessment-DB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';
    DROP DATABASE "assessment-DB";
                postgres    false            �            1259    20571    note    TABLE     �   CREATE TABLE public.note (
    id integer NOT NULL,
    title text NOT NULL,
    text text NOT NULL,
    user_id integer NOT NULL
);
    DROP TABLE public.note;
       public         heap    postgres    false            �            1259    20569    note_id_seq    SEQUENCE     �   CREATE SEQUENCE public.note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.note_id_seq;
       public          postgres    false    219            /           0    0    note_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE public.note_id_seq OWNED BY public.note.id;
          public          postgres    false    217            �            1259    20570    note_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.note_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.note_user_id_seq;
       public          postgres    false    219            0           0    0    note_user_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.note_user_id_seq OWNED BY public.note.user_id;
          public          postgres    false    218            �            1259    20679    shared_note    TABLE     �   CREATE TABLE public.shared_note (
    id integer NOT NULL,
    note_id integer NOT NULL,
    owner_id integer NOT NULL,
    recipient_id integer NOT NULL
);
    DROP TABLE public.shared_note;
       public         heap    postgres    false            �            1259    20675    shared_note_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shared_note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.shared_note_id_seq;
       public          postgres    false    224            1           0    0    shared_note_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.shared_note_id_seq OWNED BY public.shared_note.id;
          public          postgres    false    220            �            1259    20676    shared_note_note_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shared_note_note_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.shared_note_note_id_seq;
       public          postgres    false    224            2           0    0    shared_note_note_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.shared_note_note_id_seq OWNED BY public.shared_note.note_id;
          public          postgres    false    221            �            1259    20677    shared_note_owner_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shared_note_owner_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.shared_note_owner_id_seq;
       public          postgres    false    224            3           0    0    shared_note_owner_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.shared_note_owner_id_seq OWNED BY public.shared_note.owner_id;
          public          postgres    false    222            �            1259    20678    shared_note_recipient_id_seq    SEQUENCE     �   CREATE SEQUENCE public.shared_note_recipient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.shared_note_recipient_id_seq;
       public          postgres    false    224            4           0    0    shared_note_recipient_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public.shared_note_recipient_id_seq OWNED BY public.shared_note.recipient_id;
          public          postgres    false    223            �            1259    20563    user    TABLE     m   CREATE TABLE public."user" (
    id integer NOT NULL,
    email text NOT NULL,
    password text NOT NULL
);
    DROP TABLE public."user";
       public         heap    postgres    false            �            1259    20562    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    216            5           0    0    user_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.user_id_seq OWNED BY public."user".id;
          public          postgres    false    215            �           2604    20574    note id    DEFAULT     b   ALTER TABLE ONLY public.note ALTER COLUMN id SET DEFAULT nextval('public.note_id_seq'::regclass);
 6   ALTER TABLE public.note ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    217    219            �           2604    20575    note user_id    DEFAULT     l   ALTER TABLE ONLY public.note ALTER COLUMN user_id SET DEFAULT nextval('public.note_user_id_seq'::regclass);
 ;   ALTER TABLE public.note ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    219    218    219            �           2604    20682    shared_note id    DEFAULT     p   ALTER TABLE ONLY public.shared_note ALTER COLUMN id SET DEFAULT nextval('public.shared_note_id_seq'::regclass);
 =   ALTER TABLE public.shared_note ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    224    220    224            �           2604    20683    shared_note note_id    DEFAULT     z   ALTER TABLE ONLY public.shared_note ALTER COLUMN note_id SET DEFAULT nextval('public.shared_note_note_id_seq'::regclass);
 B   ALTER TABLE public.shared_note ALTER COLUMN note_id DROP DEFAULT;
       public          postgres    false    221    224    224            �           2604    20684    shared_note owner_id    DEFAULT     |   ALTER TABLE ONLY public.shared_note ALTER COLUMN owner_id SET DEFAULT nextval('public.shared_note_owner_id_seq'::regclass);
 C   ALTER TABLE public.shared_note ALTER COLUMN owner_id DROP DEFAULT;
       public          postgres    false    224    222    224            �           2604    20685    shared_note recipient_id    DEFAULT     �   ALTER TABLE ONLY public.shared_note ALTER COLUMN recipient_id SET DEFAULT nextval('public.shared_note_recipient_id_seq'::regclass);
 G   ALTER TABLE public.shared_note ALTER COLUMN recipient_id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    20566    user id    DEFAULT     d   ALTER TABLE ONLY public."user" ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 8   ALTER TABLE public."user" ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    215    216            #          0    20571    note 
   TABLE DATA           8   COPY public.note (id, title, text, user_id) FROM stdin;
    public          postgres    false    219   �-       (          0    20679    shared_note 
   TABLE DATA           J   COPY public.shared_note (id, note_id, owner_id, recipient_id) FROM stdin;
    public          postgres    false    224   �-                  0    20563    user 
   TABLE DATA           5   COPY public."user" (id, email, password) FROM stdin;
    public          postgres    false    216   .       6           0    0    note_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.note_id_seq', 5, true);
          public          postgres    false    217            7           0    0    note_user_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.note_user_id_seq', 1, false);
          public          postgres    false    218            8           0    0    shared_note_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.shared_note_id_seq', 1, true);
          public          postgres    false    220            9           0    0    shared_note_note_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.shared_note_note_id_seq', 1, false);
          public          postgres    false    221            :           0    0    shared_note_owner_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public.shared_note_owner_id_seq', 1, false);
          public          postgres    false    222            ;           0    0    shared_note_recipient_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.shared_note_recipient_id_seq', 1, false);
          public          postgres    false    223            <           0    0    user_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('public.user_id_seq', 2, true);
          public          postgres    false    215            �           2606    20579    note note_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.note DROP CONSTRAINT note_pkey;
       public            postgres    false    219            �           2606    20687    shared_note shared_note_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.shared_note
    ADD CONSTRAINT shared_note_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.shared_note DROP CONSTRAINT shared_note_pkey;
       public            postgres    false    224            �           2606    20568    user user_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public            postgres    false    216            �           2606    20688    shared_note note    FK CONSTRAINT     �   ALTER TABLE ONLY public.shared_note
    ADD CONSTRAINT note FOREIGN KEY (note_id) REFERENCES public.note(id) ON DELETE CASCADE;
 :   ALTER TABLE ONLY public.shared_note DROP CONSTRAINT note;
       public          postgres    false    219    224    3467            �           2606    20580 	   note user    FK CONSTRAINT     k   ALTER TABLE ONLY public.note
    ADD CONSTRAINT "user" FOREIGN KEY (user_id) REFERENCES public."user"(id);
 5   ALTER TABLE ONLY public.note DROP CONSTRAINT "user";
       public          postgres    false    219    3465    216            #   M   x�3�I-.Q��/I���,V �D��XH̐ˈ381� ']M1D�ʘ3� %�$5MY�B)T�Д(�b���� N�1      (      x�3�4�4�4����� ��          �   x�u�I�0 �5=�J1F�����!5(q�-C�T����<b����4
d�E���X&�%|�����6۳��0U1_׎H*�&wO,�.�c�D��">��~��E�~��S�9�*�t���JẒ+���֐�;R�+�0���#�~i�4�     