PGDMP     ;    *            	    |           car_shop    15.3    15.3 %    0           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            1           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            2           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            3           1262    24590    car_shop    DATABASE     �   CREATE DATABASE car_shop WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE car_shop;
                postgres    false            P           1247    24600    fuel    TYPE     i   CREATE TYPE public.fuel AS ENUM (
    'petrol',
    'diesel',
    'electric',
    'hybrid',
    'LPG'
);
    DROP TYPE public.fuel;
       public          postgres    false            M           1247    24592    transmission    TYPE     w   CREATE TYPE public.transmission AS ENUM (
    'manual_gearbox',
    ' semi_automatic',
    'automatic_transmission'
);
    DROP TYPE public.transmission;
       public          postgres    false            b           1247    41116    type    TYPE     A   CREATE TYPE public.type AS ENUM (
    'Buying',
    'Selling'
);
    DROP TYPE public.type;
       public          postgres    false            S           1247    24612    type_    TYPE     �   CREATE TYPE public.type_ AS ENUM (
    'cabriolet',
    'coupe',
    'estate_car',
    'sUV',
    'saloon',
    'van',
    'small_car'
);
    DROP TYPE public.type_;
       public          postgres    false            �            1259    24643    cars    TABLE     �  CREATE TABLE public.cars (
    id integer NOT NULL,
    date_of_creation date NOT NULL,
    date_of_last_update date NOT NULL,
    make character varying(20) NOT NULL,
    model character varying(20) NOT NULL,
    mileage integer NOT NULL,
    color character varying(20) NOT NULL,
    transmission public.transmission NOT NULL,
    fuel_type public.fuel NOT NULL,
    vehicle_type public.type_ NOT NULL,
    dealer_id integer NOT NULL,
    owner_id integer,
    paths jsonb
);
    DROP TABLE public.cars;
       public         heap    postgres    false    845    848    851            �            1259    24642    cars_id_seq    SEQUENCE     �   ALTER TABLE public.cars ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.cars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    217            �            1259    49313 	   cars_info    TABLE     �   CREATE TABLE public.cars_info (
    make character varying(20) NOT NULL,
    model character varying(20) NOT NULL,
    transmission public.transmission NOT NULL,
    fuel_type public.fuel NOT NULL,
    vehicle_type public.type_ NOT NULL
);
    DROP TABLE public.cars_info;
       public         heap    postgres    false    845    848    851            �            1259    24637    dealers    TABLE     �   CREATE TABLE public.dealers (
    id integer NOT NULL,
    date_of_creation date NOT NULL,
    date_of_last_update date NOT NULL,
    dealer_name character varying(20) NOT NULL
);
    DROP TABLE public.dealers;
       public         heap    postgres    false            �            1259    24636    dealers_id_seq    SEQUENCE     �   ALTER TABLE public.dealers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.dealers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215            �            1259    49322    refresh_tokens    TABLE     Q   CREATE TABLE public.refresh_tokens (
    refresh_token character varying(255)
);
 "   DROP TABLE public.refresh_tokens;
       public         heap    postgres    false            �            1259    24678    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    surname character varying(20) NOT NULL,
    email character varying(100),
    type public.type
);
    DROP TABLE public.users;
       public         heap    postgres    false    866            �            1259    24677    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    219            4           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    218            �            1259    24686 
   users_info    TABLE     �   CREATE TABLE public.users_info (
    id smallint NOT NULL,
    email character varying(100) NOT NULL,
    hash character varying(100) NOT NULL,
    username character varying(30)
);
    DROP TABLE public.users_info;
       public         heap    postgres    false            �           2604    24681    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    218    219            (          0    24643    cars 
   TABLE DATA           �   COPY public.cars (id, date_of_creation, date_of_last_update, make, model, mileage, color, transmission, fuel_type, vehicle_type, dealer_id, owner_id, paths) FROM stdin;
    public          postgres    false    217   �)       ,          0    49313 	   cars_info 
   TABLE DATA           W   COPY public.cars_info (make, model, transmission, fuel_type, vehicle_type) FROM stdin;
    public          postgres    false    221   |,       &          0    24637    dealers 
   TABLE DATA           Y   COPY public.dealers (id, date_of_creation, date_of_last_update, dealer_name) FROM stdin;
    public          postgres    false    215   J1       -          0    49322    refresh_tokens 
   TABLE DATA           7   COPY public.refresh_tokens (refresh_token) FROM stdin;
    public          postgres    false    222   �1       *          0    24678    users 
   TABLE DATA           ?   COPY public.users (id, name, surname, email, type) FROM stdin;
    public          postgres    false    219   H       +          0    24686 
   users_info 
   TABLE DATA           ?   COPY public.users_info (id, email, hash, username) FROM stdin;
    public          postgres    false    220   OU       5           0    0    cars_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.cars_id_seq', 19697, true);
          public          postgres    false    216            6           0    0    dealers_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.dealers_id_seq', 13, true);
          public          postgres    false    214            7           0    0    users_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.users_id_seq', 2932, true);
          public          postgres    false    218            �           2606    24647    cars cars_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT cars_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.cars DROP CONSTRAINT cars_pkey;
       public            postgres    false    217            �           2606    24641    dealers dealers_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.dealers
    ADD CONSTRAINT dealers_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.dealers DROP CONSTRAINT dealers_pkey;
       public            postgres    false    215            �           2606    24685    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    219            �           2606    24690    users_info users_info_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public.users_info
    ADD CONSTRAINT users_info_email_key UNIQUE (email);
 I   ALTER TABLE ONLY public.users_info DROP CONSTRAINT users_info_email_key;
       public            postgres    false    220            �           2606    24727 "   users_info users_info_username_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.users_info
    ADD CONSTRAINT users_info_username_key UNIQUE (username);
 L   ALTER TABLE ONLY public.users_info DROP CONSTRAINT users_info_username_key;
       public            postgres    false    220            �           2606    24683    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    219            �           2606    41121    cars dealer_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT dealer_id_fk FOREIGN KEY (dealer_id) REFERENCES public.users(id) ON DELETE SET NULL;
 ;   ALTER TABLE ONLY public.cars DROP CONSTRAINT dealer_id_fk;
       public          postgres    false    219    3215    217            �           2606    41126    cars owner_id_fk    FK CONSTRAINT     �   ALTER TABLE ONLY public.cars
    ADD CONSTRAINT owner_id_fk FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE SET NULL;
 :   ALTER TABLE ONLY public.cars DROP CONSTRAINT owner_id_fk;
       public          postgres    false    217    219    3215            �           2606    24691     users_info users_info_email_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.users_info
    ADD CONSTRAINT users_info_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);
 J   ALTER TABLE ONLY public.users_info DROP CONSTRAINT users_info_email_fkey;
       public          postgres    false    219    220    3213            (   �  x���I��0���_��L���� q��ˀ�c���qⲳ�z3�b�0�B���"�T}���'YPL�=��4:-�J˥��%�5x�����X)��������]Ԧz�Q7���C|z���T���!+�����]�h$�HB��՚��^&�HR�R��"8&�vdZH8x=aV&Y�7ϟ](-���9*�rJA���I��#y��#RrH��3����f��
[%�u�D8E�M����%/t{tx8��\w��6
1�k^Uc��}�KS&f�g��'v���Y;*	q�GW-a/�+4J7�6՜�q^*=V�΋s@?����|��(xI�Z��}�Z���4��,AM�Lk�-T�U���m����.�"�M���K;- b��|%�eG����G�v2����ltZ����CN��g��(!1j�&�*qf�f���N��P�n(�A�3>�����?|�x4��:�G��q�E�=�Y��C�����w��[�v�����eH��Xv1(?��@�O�Ȳ?���0�O�[��
���8T}��M�&ie�.��M:G�^+ރ�u�h�Z��kH'�9� b�B&�f����8�=���w���an�����x��p�/m��|ry�U�M��x����n��
�):       ,   �  x����n�PD��W�R ��&E�]��@�8B!����Ѣ_�R�ҽ�9�6_����?�t���ɦ���ӷ��?�~L^��~�����L�CĪy�w�u{p���U�����0���R2z׷��9v��Эjɍ!F�n�]��U+q���a�l�M���n[K4F������2Fb�Z�X%+�8j��F�ڒ�Rc�)�N�T�
ӫģړ�yj���l��l��L�+��*Y!�Q%.�V�e4(x����R��S��/$��0�y�?�;j�i��A���U�Q!l�*s�=	)�Aΰ�t�0�Jɀ����\��өş��[�(DxJ��B���hW��*YB�x@v%�R*ty��V�EN�O����Ը�V�
1�*qQ�"ׅW������!�\��@�&?<�jH"+��i��|ϱK�L��E�����K*�X9��T�̭�4��I
(y�T�ß'��)�����T��,'���a|�����Y�IHȴI�@�tN�*�!K�\�9MY��<l�O���v������<Pr���
���\��JN�IR�@H�8����>��[��-<��|�3sp�x�&�f�D��,Y�����`��?��U���W������j���c��¿5�����;���?�����-=Kem�8|HԒ�ˌi�GBt^���<��n<!��m��Ty���\9��reQ�Hୠ����Ȭ0{�%��ضq�f�9�4S�ڗ���lFe�\4b1���sՒ&Ҿ �\�^i�Za3�P#d�jd�C�q�N���l�Ɓzj��_7�>E4e�Xz+����h����Ƚ�l)l��PZMY2�\��S��O�p.�o�Њ�"u�3Rn�I�M��~���*G4\kK��ϒU�@�&�,K�|���Uv�da����x�5�L���n�4�%K�fZ��rE�"�qV����5pք�6�����v�E78$u�K�E{/�l��/{tG�Iͼ����O}=�>7V�[��[��,�v��ҍgz�z�/s�]���x1�T�����W7U�h�=�-Ao93��Ӷ8�q�ٕ��m/���l!����,W8W&W��P�j��ʌ�r�̯.��5�6�}���#hfp�=�nQ���U�v�Ծ%���-s�L��ɶQ3[^���_��W7�ǌ�`F�Λ�����m�����ؾ㸫�D�?1p��4�HMgK����-(�������]
�      &   l   x�3�4202�5��52@f:�dr�!DP�>�I�\� ]S]Ccdf@NbIi�%i����<.C�a�y�E�\��8�J�2s��pH�df5��N������� �1�      -      x��|I��J�����,1�l@-!�y�f�����6�R�'��ґ�WeFDf'ݥ"��R/%�9DH+�Y�XL�7��'-��]z{/��������r-��۴C�5&�u��2�ώ�� ��,#u�a��=�
�u��obI^~_*�����~ƿS7�qÞ*B��ǐ\�o{*�S@R���n��?T������$8��G(�[��z(i��Z�6�qޯ=�������w�M|�]F�ٍ������3�>I�>{�w�&�J]�^��)O�q�n��nKŚ�LD���K}#�ċ������K��H�_�M,=���i7����lފ���k���6���C݂����y
WL�J�1[���4#��͏������Z�~�o�w����[�{o���ox@�Q�(���k���Og�o�[.O���z�5�[�b�q�y��$]��p8��	�p.����]�;{7�W4K����ec8�gV�"I�d�P��c����v�!�����R#��B>�\зL�{�R��q̋m V
-�Ի:������m`�����9P�	7�r#3��Q‘3;k����Ƿ�o|ةC�S��K���rt��6JnVakЗ��O���U��i�hi����n��<��7�,"3/��hϒ�y�Ы׿�����咔�x����T�+QW���ϓũZ�0�+^��Θ����ĩi8��B�r$�T���፴��x���)p="��_�'JǱ����~� �����TY�KS�ND�bz�ǗƇ�����H�2K��؛��r	#K��� Z���G���n]�����_��3>D�=��O����c^!�R�H��Ej�;��!^��ȩ���So7�x�P
$�R[�����0��l�Auf�p�k�Q��s����2��1����A
�O	~����둣�yu�9�+-��QZh���~�˖3���������v\�������#_u�1C,B6jx�� �VLޞ{W��-���.Hɸ6�P��p��[���-5����~������s�5�Ϛ[���\齚)�R���s�R��s�=����Ǔ��ٯ\o�;4/|�����i\#��D~��4���/��zU��h,�D0��wL������5��a�O]����__��o|
zym�Q/�x�X��l��Q��ݽiq2�յ]��_(п���5;!����Y���1�<4TǕE��>ց �*�3�#"d��r�n?�?O�G���՞��C�[��F-F��G�y�g]����� Վ��
O!|LZd�*:\���@�Pq��&�{�@��R�7�a�}H�>�{�T��?�Y���S.<<g���e8�=��b���+�nZő\T������a7�A��ָ�����p�����j&��C=�,`���@y��y��A�SC5G�T��L�P[ç�_���@g�5H�.5X���D���(�!m��¤�tc�_̧�������}�ϐ;N�;檂`=�!y���w�pg4���)ُ�z:s��]Kb��in���Q�=� >��r�`����������G�"������	qaT�f�U��Q?�I�֐���\�ս|T쇏b��m�͝�*�X�>�iH<.p�}�K��\&��y� ��&Z����B?���`ݏ�2�~�O�r>0w�(�_0�v�?\��p���RW��ڧ�@�G�؃,_H.�����Q����c�$��10�`X� 3f��Q��j:�����i������1Tl����Jᔰ�gh2Ã/V��f���U��!��6�=)�y�#�����#��䌒�b	鿘O�T����;%7��_j��#���v��~��[,u-f�?!����bH��B�j¡�l�.��C�G��p�L���&}���#qk�h/D�O�����A�A$j��6K�@�?o8f��K�/Zuz4`eR�Ɔ����1w�$�NG�Ǭ\�p�h+����A|��'T-P��ro0�8�4涥�aC����atN�D���2&�'��WPǈ��	V����x�|�#\��6wr����5��x"p6�n�?�Ge1�&�������mAgpyw�R��X���!]��_�Ɯ�(�t%ԇBlTߊ$<�v:
�KrcC�V��B���_�O-���EiK�6��$0U��np��E�L�h�%X�k����|?=R����b�6ɴ��}qꩡT`��wtzr4��'F�73�GP����әVS��{��,��v)	��l��JcM��D��#} �ש�/�/R	G*2��}�d��g��pgf��>�l��E��_4�DvV?jO��7/~;��T�3�U�Zȳ�Q6°����U��t,��lڞ6ٵ�����9�S�-E΁ݭ#��֥}`�P�� V I.�#KCx�v���b��Z�����J�k�VH��Mc�^Y$�Ȅg-��d��r��~O�&��yaM�ൺ�Ep�_�Fpef۞�zJC����߯�!�=I	�Tg�R'5B���@ ����ă���}��恳a#E=�nu����Cc��?Q~1���Ɯ^ys-	��Ma7Xd��a#�-%���T��N��hQw�jm�������d��vo)��t�BfL�w>���z�����̵������R,�y�U�����u������?a���gQWk�͂�׭��{�y�C+.���;,�ߓ�}��co<V������gr7�P�2,���W�{퀿漻w$r�t�ح�����������^7�F����4�F�-"�]��	P���@<���T�EڬMi<�
cIV\ul���d:�L(�W��-�3Q��o(��)b���Q'��)��'7�s 8�$���͙�!п�8�КB��ď24VH	�1����®Y�A����<ſ�8$��|<�/���A��:��	I�,����M�_^�"�3Q�d�>���|5<ޓ��r1�7@t�,�5��7'{�� ��F(hH3�~��ܯ�|Ԑ�� ��m!�E ���Ws�ruV�:�Ƀ&)�8L����c��!2<���.}P���rmT����]���p��Ox7K�-u�-�t�%�u��~�6���+jt�(8��&7&>���?���

)���������Dp�v�F�� S��70��o��*�n��C�D�������]���۔}�x�V��� ��s��=��^|Jo�x̌�n�W{e�5��X&�>"�����Ĳ�FR���L�\���Qf&���p"��L�#^Jd��{3��`����)*<�Y
tˍ<�6]쑴*�~fi�>�,�T�J���蝥��C�s�4�����D�i_u�<����M��&l��LS�Z�$v�O��CX&-��\{��s�Dg�]J#we �9ݵ$��#Ǎ�Θ��i��z�4�Կn}�l:��L�.4B �0�����ܣH�e�\��3���F$\3`���ݝ�p\Um9�r|��V��[> Grq�~"8��LD_�sO!ɐ'����b�ʪ�A<��+ .�����Y[^#"F�<k�o°9vY�b�H<*pn�,��v1#i��jǙ�g+��b��Ѥq�"YM���ʒz�o�(_��N/_��5��@�����.5y{�3
Sc���Y���Jpv���8��r�����x�ʥ ����h��Қ�*b?��#"E{e�p ��V; 3�N�ޚ�Mw�zx�|z�\�e:������Y�pP���W8�w� &
�7���ͥ.��b�8T��|s���Ӿ�X0z;�f�n���N�M�Dۄ��|��G�^��g뵯�o�|
Ux |��
.ZD��2FD��{�4܋=�vī�=�yQ�L����w������cc��]��D���+��co���?�H�r��.�*w��aW��Y��J7�똅A;�b�����Oѫ�ĭ5�>�ݙ��U�	��$�h5.΄��H?�ӥU�.�z����=�&[;�sa#A�鍉�N��kc�����5����E�X���� 5  y�q��k��iC�|l�x~p"@N��|���q��"H[]�Û��n/�/��M�S�S����5��@(�ٕ�_1),?�ط��<)ủu�����r�?��9w�r_7ð�|!�w�����`t$�󵼩,�s)��7a�����H���Cȟ��/2�;��7�W�`��R�L��`�];C9|�ଅE�
`Y'p��`�hk�I>--2G���n�_��r&��T�=�G��Yi�ҡ���R.�F�Wc�b�A��*�k3�D��x��>��?x ϦZFs�eb"o#��c�Zx�ZV�"�ngN�1%��rA��x��(8& /3����!�C�*����}����7�{g�� !����嬞e��t�ڇ�]ۉ��~�i<��UB��u�؅N�l�[�A�b��_ً��Z����'�����0K��ƣb	��Ftm_SN��w�s���z=�g�i?��kne���#o�@3б^�0�]P 7״QX#}y5��C!��2B��p�EBX���	���'Q>���|�?@t��~���ś)B��T�E�O��[� ������|��IU������葯��}�ʓ��ggs��m,0Ҵx|^���T �V�QH�o����`ן��z����X��a �6 jE)�7���R��!��:�/������v]I�K����T>,(����3�2?��c^~1'�x��:[�G�ύcڊE��9-N����I.�8v���r�Ɯ|�>���	D�h1^L��6B�F�\�֗�iB��2�֟|@�W��]�^繴wmM�N7��% �b�<�4R2mћ��>�� �q�q�H'ߛ#�[֢%�9����NV R�?���پ���-1'��Q��Y����`"����:k,��"Q��6P�>{��K��Hq,�
�սc�P��NU���T[v8�Y��VO��~��!A~�&�봽�&���J�kb%�1C�y�Ϟ���v�{�=&6�}~��g'�|���nr>��a,ò��S�����>��q�N	����.I'�7��B�{o5��Mw�_.֥/�g���@����,>1�4iy���#���Pa���ړ��Ԅ�S,�]1}x��]�f4_7FF�]�Q�X�(�6���<���]�A��_]�9���'}�r��� r��@�,_(LIـ�l]�H?N�rz4_5�@#N��ّ<��!�B����rӍ��_LTC����h��� Q�c�O���S�QRbg}$�PA0��u�}3P���5dK�e��K��\;�;��TX��9䓇��;�gL�:�F%�(�e�."�i���jX�
�O�>�ja����b�:4k-'��j1$d�7�������C��P���!�>;��=���]����G�"����>`�c��X�� �g��(@�Bz[~����I�n�bݴ�_uT�^@П�̙��ƞD���B�Q�7���;|I�ײ��T�o�t��=��^
[�ٴ�x�D��8��C����O����ri��E��?n21I����5Ts�>c�k" R�F�4	�ݒ�������?�      *   /  x��[Ks�8>#�b+�\�.���k+ٚ9L��u��^��E)V�i8�~�A
�$ ��M��׍F����{��)o�?�g��d�{���|�'��n�yf�"�k�>�⩅6&���o&���B��;��O�ๅ�u����'���V�%���������=��f{B�S�O~)v'�੅�K=��GZ��2/	�q#Y���f��늦#e�ad�-�u��g*Mx��b�/��Q��ƅ�\-���*�#+�7�l�^e�*J��
��D����Rxj}<e'U�J�MRex�I�	���&5�]V���M�Z����퉡�V��Ճ�q�6i¡	I�PxE��X9�6����ͮ�m��[�U������ڕE	�"�f���J����6Y�K݄��0�����FS�/kY�*�)Sݴ�����5�6�\�0��� $�:ܲ�
��-[hW�ʢ�cݏ���TAWR����A�+c�GJ�Gz<A��}�W[���-aܪ��[C}� {�ֻz��j�'%���Ҷ�0����m���n�� �YY�R�h�߸�c���v�͕Ln4ӛ�F<1C��v�%h`��X�L�jS*�3)��}oD�K���>؁)�ß�Z��â<0p�:\`[�~������S�[�	�$��蝿+��Q�ʠ�7y�6�*�����D�� �{��Dg�N`��:G<|��r��}����Ұi�ZhF��(�I��n2vЉ�n-�{_��W:�Q�AE{}K{��[��н�U�y�e�O � Z�-oʀ!���% ��H#JBR5c�Aû�:0	�]�X�	*���
���6�Ϩ��N7� ؋��܌� �#Q�^Eq(�(�Ϸ�0���U�x5l�'��(Ղ �7�%�b��*~%z%�S��d��)x!+7���T�{���]�)�;�vwI�@���p+IU�g���OxAG75��xVM/�T`RӲ��I��0�.uq!x�h���$�q{�Ì�抗� ����Qnb��.D�D��|���5$�a���/k)UЗ��\̝�v$[j
kYi�ey�/W(��Ij$4�i#��1��f�4X �I,;�wL���h�mŊ��%k�j��
X�79��%#
$X�{�Kf�)�[9��Y��S�MzNLUiB����]B�I�I�^A�wj�.W��J��	�4���4����|`s�BM�'��z����Mm��,��L��u/�^����|��+��� ��m-��]���wv_-�ɡ<�	]����:�/��±�$Ih"���Y=(MHg(�M�{�"zضC/�q<wy��0�N�������n�B2�ӗd�����t�TXcM-��H���Z1�,Q2�l�`-P9����BD��kaܽ�8d����a&`_�-������Fx�8q�n�&� ��6�4k�ra84��eș��i�f�]�sV6-,��4����o�o��K�����GFr��jeG���Y��|"ԧ��.=�nM��gd��O��{Y=>����ɧ�r�����b�S�S���l���'"�i@���(�s�c�-�+�}/�k���R��U
@UC��y쮟f3����r�a�7kv۞ɸ��Yb������\��tK<���yA��b7o��ǆ�O�x�Qv5dc��UW]-�Gbs�<�׻��5��Lyf"�̷�)�������LD���p�S�"ׂ�6l�'��mx� �8nno���m.��+>~�>V���g�H��A�83ł���'%B���
��>�����e�Gr��.�=��;�r�-�ސ!6� ⒆���U�Y�ac,^J�dN��#��g���,t�Z����,r/��ʉzׅj��+�Alv@ ����0$���5xP���U�����m�k�_"yz%����C4�o�e��#������S����M�A�푛��!�����ԥ�"�9��k�a�����͕y�ģ,֐�X���B|����1�lkyj��[E�Y�.�3���㧕�W|�`��7�Li�$�z^%*��rw�;	{%�*�}]�����D��I��{y�6��C�A��U��''\r�U�ҳ��I�,9~��e0 K4f$C��h�(�{�b2"I�w':u\�����:�T�`�)D˺
��v�@���cl�X�!9�Fkl���7�*�Lm����cm�CͿ��X�.t0h"3N&�,�	���x)�t�O���$���<J��Y���p�<kx��!�r8hD@"�q��@�S���,��N��\�`�u��&��H8$�|O��qoJ������u J'*|�v̧�H,��׿.2�
��7�P��!���U)��(��Q��`�W�rf��҄����QЌ�myl�WRm��s)���T�oɧ���^�z�*�%�֫*�
���IxFA�\�i6�4=�]?��z/� �@]Ҟ��8��L}H���d^957��"���@�f�O��T���s�%9�?��?2n����N<������,�z�\�=M�FWO�I
�@���Q�z��6�&���h��ȔG��py⫌'�}��
L�I���������qW�>��� �2!;��9�6��)��g�P�=c�(.���x\�
�$=�Wg�>��g"��)�`���_�|�k��Y��F�s�E��A�;~�����t�OU��5��AH0>��
���UFH0KK��OBx3C=�(�a����=H�`GE
a��T����&p���c�U]lʪ�_���J�b;��t�l�t�P6�N�7VM׬ѡ���,=nD�!
�XG�[�|���1V9ͬ��h�`[��YcD��h�B�%�c�%�C�Ρ�B ����1\��(��8����^�d$��˰"�����q�{�d�#".�ߔwt�w�=m9�K_O�k,R(0�M]�{����%>��!t��d�n�o)��]W����jl���QbG��J��Jz��U�c��ַ���nj�լ����C�,x1I�	n�$����J���T�Ki�J���B�͑�r=��1[��C�,'�$\��4*��c�M2V֝����[�ꞧ�;��Mo*��VK��#�7>�daHV��w+��{Z=�=���������A�,F�E�1��H�N���_�+�ea�M�?%}PV�g��$�г�,�0OU��!��c�/xDaBvC�#lرaKX?l�}����O�t)�{�'�Ow�O$��j%WU�����d��3l�}Wȇ !duf1�RF��|X��"�^~��9��O�m"jQB�X7�+hW}�u��0��vGQP�O��g_�?�yTx�c	��5���>&��*dZ_�����y�������h      +      x����r�H��{��9�ٺY�<X��� A�����<=����ʔ��{�.1eRZ��{Dxx�"P0�ë�,��4�?��PyY	����������D��Q�%�g�O����!C����ؠ�4�Ҝ��ñ�u�������o�?�	�P ���Pűt�N��ηУ�%����h��ϊ��l����~!�#u8(5�����}�6B� �(�X2g��ތ�Ju��f�f�kVл��S?����� t�T��c�C�"�(�3,��"0� �#��!es��W�'��v�������h�`ӎĵ�]��<�H���5����W�'��\�+�zq�*�����؛ �!�Ǵ�����n��k�\��@��@�'�rjL�K�JD����@I)aʏdB�o�����\��U���_���{�cFKT=�3�<4-R ��*�-����BY�����~r�Y���B?޻.K���fa��qTLm�2'�A��a�MMt5�T�B0�k
�Nb�v
��#N��'��8g�o�x-V��̮�r@��'�[�v�>$�Eu�j�"���Pd�?I�5G������0���զ4A'. �W�]>�G(��l�+	���G���Q�>f�O0�J�(<��x%8��  �ky�SP,F��˵W��7�`��aG��SR�X���p�=�$*�lL,*	�<�mD�x�_��$r�_Iĳ�C'�����G��:ĕv�ĩ��<\��D�)ր���9)�\y.�����~�V�.L�Jv�VXXo�8萍� ����Ɲ�L�WM������W���W�O�C��銧s���V�{%ƶ��\���F�#U>;'o��`�KWu1��X���)�v��� ��^����D���A�����[�x��W�������#J���p���nU<����7�E J�<nw�o�(�����yJi�����y�a?�H�.���&�s�>�yW�����s �T�����x�����C�57��`o�����]!Z�Lm7����zVH5�Y@� �{h����<�	Z�k0Þ��k�dn? MT@�xZ:d3��q���Θ��z]q|d�V�K� ���?)�+J+����#�9m��� ��޵��g�e�ytP��S�:9F=)���7R	�G�.�Z���i?n<�G��ȡ���^Py>��Ƙ
H'Y[��5d��	GQ���;<�^�*�vS� �)tk"_QI0??|6����U��A.S�z�^�'��'�#١;O$b���JQә��\�B� ̟	���l���k���w3��^��b�Rө���EVܒ�٪��!&�^$��w�Z'GY�W3�����wj�p��<pמ��.GP9λku�ـю�K�'\�ho8��+����픋���q���9$��lyk�1�扏|=o64C���]�����u&�,�>T�=q)젼?�ٸ�
Bl}�: v;�~jNr�A�~{MIH������豈]��v��vmP:�>`lv�Ŀm1%�9H����L�Lb�����������b���X��1��G'��PP��ӧ����A��?��yI���Ec�鴭ph~�eY�b��I.G�AE�2��#4@�=�5P�ğxD���F��C��H=��T�R�P��&BKw6�Kh��v�4�v"��}.#�w	*���Շ���12�jP�F��8�i֕Z�"[��u�W�;���B��X�yWў��6�#A�~-y��W��`����mk�G}=w�딡�ߘ�1�KM��@��S4,Y�&sY��,W��߁�b!Yr��`~��v���|B���E�՟V;��9���e��P�ϥh��U�����'�^G���L�ȗU#�$�>Gj�&L�_#��dg�A���#U���o1�ֳ�0�4"�Ōco:�'^�$
����<��:��y	��*��[�9m>��&{�����3���k���>������=H�^��"�;�#��� �)[��������鋴S�ߩ�:���,<�Ɖ���I��-\k׃*v@�9��mKO��f��ƿ�{�ؒ�R�}w�/Wպ����6�~B-�ӣ�9����C���+����+���]2�@���C�(�Qq�J��h0 ��|"�DS{�\,����̓��N~O���w���z��t%��2�G�1.6�$�_(5��Ya��ˍ{���_������-)�:]"Ԕ\-jW9Dyw\�VMeyjT���Z�ޝ�n�����n3��{��O,`0cѫ�*��BT��8�E9��P���J���̣��7T;	�I�(����F�	_�/r���h�+�S�^� N��&^Mt�o�rX�Y�O����U�ɺ1��b�J.��; �qoQ����u̅���+ ���NC~���ǐ�g�Sk����QS���ȁ �;�,� t��:��@�@�o�D��_��O"��T=L�8�q���0�A��,�[�,��n��,.��!�۝���8|�R��
T'��Q��*�)Ӓ�D�	�����+\����oT�wj��f\4ؙA��"lsuN��X�uC�� W��3v�*��Em����L}	�??�o�L�	�3n��8hП"#���JO����h�I5��zyy���S�c��;�3մϷ�4�k̛��"���Q0C��1�|!�l=?�>�ꛫ�{��R��˷1�|A�V�{9gLX�O\� 5�����l�l��
	�vCq��`�o���w3+�PO�щ�����Ea��P��奜O��eaw�nH*��z_��^�=�>kiHk&�@N9��J<
wm�"�KCX�T���(:�/���E�{Z �����Wzf� !p�lٸw��S�D�!�9�����N@�
��`jޮ���{c1�j~'[�lW4pOi�[�`S�f?���]vN�2Iee��Ո(��d����S���ҝ�ό��L!Co�Q���ŶOb�t���p��U��Q~k���������PtC�(KױF�!��L4\�[׆M8�Q�/#�N�&���km�k|7 ����߷!
���ɮ�m4�����0rl����c�EM1[�d�Z�g��=�"�6����T�k+Tϻz�Y�4� {�L�j�� <��<\�"���H�nſjј�Ր4�\;��7���@Z��[wV�l��i�±����	h�����3^��՚0%ӳy��Y8�֋r4�����'0��{�D��W�Be9�6.��!~��)�Ӡ��mB�C򦛗&`�0Z/-�G^躁�`"�u����FƘO*iѻM�F�W�^���aw�n�\�0�>
�b�m�d1Z5�P	7M�d|�D�`!\C%�{�uq������H����+p[�c�|パY<�,����j���װ<�D}����~���Y��Ig�t!E,Ng��.�T� �V��ɾ²�UT�֡"���-���%�L��4�h4�k�C�'k� 0B���:yǝ�ԅ��-o�Q8\:ޕ��|���A�/�y���yr.q�����Pz�IG�����9��q$46PꂒKi;
[�e9���_���=��/��_�p�m�t�BX�c����=Da^�E��I�]3�؞��/[�_��������{tH�	�����x?k�~�����uVY���q�����!���</��Jg�@����~e~)t6��񮴎�ׁ����Yȝ�d��귵܃8���� ��MˣY�y�"���U��NgŨ̀�KQHؠ���h�Ϻ��c����n�_h��x~~�ƣ7��%�L���uy=r���=(�l����ju�dnI+M��
�Ä��z/��B�� ����`|�Ūȹ�B��\Y)`+����[�� :3!Z�2��k�k�/�/?|�l�#���5d-��Vv�.�*�r��u ��8\�E�;FlꞺ��_(���_��GzA��EZ�hӡR9��2��ϒ+`�icg&ް����v�����ϐ�w��d�Hd�s.$���##�e    ��IO Y�6��l�f;(G�����I���Ӱ{�5�-�$rta(L��Q�!Ń�ϲ�W �a)�BQ��d�b�5^vB�q����iVҚ\�Ӝ�����8�8�lz����	�($crT����{�#�_�e���D,C���6f	|����<u�A{��IϠ,լ\����
��o:�ج��F;!�jŃ�b�j�t����067mU�e�ɠ���G�[�v�=�"����ϧM��\g�0�b��s���m�u�	81e?L�i�w�4��� �Z��R�5�A����%3�5����SE�T���QR��m䴻�poS��m4?D�;��(��^ǰg1}=�W_���#�c�\;�B.͝�{��D���X���� ��`�*�]���n �F��6KP�V<$k��R7��r�[��[���o�4��E=g��#��Ş��7z+��hI���Ju5��x%�tk��������x_�ZoH�Vּ{�ˮ�wz�D�{I�e���Xz�8i�J0୐x��{��m��Ns�
���m{�M�/F�5����VMkZ�C`�7n<�]�DJ-�:���<����fu�xUZ9�짐�����q擶�3!��z��E3��X>3��������܌�#��W��������&��%h�
w@�<����@%K��:zgm*�{�$��OP����T���ݧxV�=yc:J�.H=ӱ��W��#��`�lP#,Of��w�0_hL�=���5O�b��pӚ����S�������+'�h�PP��k-��0ژ���(A};����6lN��"i�4��e��L�p������KwC,��:r�[%�V~��0��{j��f��Z�ڬ�:�d�Ǻ�."d&��:�)�"�������<Y7�|u�f�}�1>e�S��n�\�&����� q��1�@ i	wp�A�&�Jf�#��͔o�b�R����\��@G8UUϢ]^"��Ǡ3Jl����V��LO@�-��	%ۭ�j�l�S��0Ȕ��hR�qlYv��O����Ca�{%_Y�H�ہ��`u�j��a��fҾ��K���a!����M,�B'؏����?�\k)�"�.�y#O��z�$�F}3�_����.�M�Zi�\)Z�eIv��1F;O�7ʸ����Eg�0��J�������z�'��ڲyB��d�����H��,`��Z>O�g�f������S�5o�A�Y�T��� E��g����bx0z~�lU��1Ƽ0�ɬ�����vs�}'�����ƅ�3���X�+E�-a��Z�`##�	t��8�V��5��t�v��n�0�nx�/�'i<�y:������ N�v�e����GQE�d��qf>/�<$B�=�}�B��H�3�Q����'`���BKg���x�bq�ǝ��f �\f~t@;�T�wS �q=������ClB~@��HS�z�D�D�Y��ڊA�c�<�0���}���c;p��;����6"��i鱞���ѫ� �i*��U�X��z��;�a��Jyܹ��QY\�\��A�=R��"vY�M�����AY���u�ۮ�k�cȏO�;�%S��r)�,_]1�X �4[�4���֦*O�g�]S\5�*:�9$��ق���+pPcݣ!�Ԯ�ؗ�jG, �z}�{�"pHū}:3%��ay&�;��xa�ͷ2��g7SU����)^4�t��7��iH��q}�f�E{��5����O=�~�Z`�@tUD+��& �JA���!�)[���4ǚ�s�i�-������>�֑�	=L�3���N	��ʶPq����u�'����?��w�D?��\s���T�c�t�^�nw�ƀ�V/��l�m���~b�ϼ�&�S�k�mR%�M4X�9?�wm��|�O`B�{�A�V��Dz*^<��\_�O�=�Rn������U\9�`3�D}҃�s�W��l��=V��FMf0�$r'�����X�/@�j����t@"���A0���Z�]YVd�R�0�Ɯ�P�Ө�0��[�mt�E�ۑ2)<D�U � �����0���(�EO�O��辱ҏ��k�a�,z��$�V�f3�Ҥ�]��#8�$d��E΍F���Aj��_��e��2ڦ�z��5åF��Od�+}|,	K��嘥���Es�<��?�8��4y��T
hN���G�s�?6I9ݰ(��@01�H���H!�R����G��+�W�gp�����P��j�����V���YL��>�e1��Gb���͇�$� 4������3����};lO���!z�[�����@"����h=�B,{�/�:|y���i�G���}{0{�,��-^�VGǂ�rl�,��#9
g��hᴏ<L��|~+��}#�8ۓ��BhRz��N"0ݷx�੝�Z�|^����	[��'L}M�L���ʮ��r���/���R�+x9R��/5���-�ڬ���ow��_��'���;����č��pC�̑�;l?8����[wX}�B����70�ؒ3���"�]��*T��ā�	�ڂg WqzZ2�B����C����G0���P�7��E(�VK�&�ôH��1s�L�]2�l �X8(�ۅf�ߘ8@�*�P��B�����s�d�<宏A�ְ
��r��C���)���`�1홌���e��n?��<og�=DUU�r�D��ב�_�u��{?Q�:t�����r1�Z��vA�������0�q89
�d��h҅�\�������FhӢ�\�y��Ή��:�NV8ʮ���ď]���x?-uU�,�u��5��y�ʚ�y�n����?���P�b���9S֪�t��6]�? ������uH��d��0�aH�
�8�e�|#�8k�����{[,�dniV���UdB�n���5�Ӳ��>`�����*�E�2��i%uۊ�nݕU�t')ȞWѻ��s���L�~�>pj`��>��������ɱ)7]���|<HTO�L�+r�w���{�K�R)�-47��/%^���J��������P���	�2������a�+�өDƝٓ1KprI�.^Z+0�C��?�z���y(o�$�N��E��a�*���~P�d�/G��K�=��m4b��Xէ���N�(�tU��}����(+����F7d2��Y�WT���Iw��e�.h&�9*X<n�����c:E���3�9ܟ 㳶>]M��3�2��;Eq��fd����wP�9����GЗ�����+����	S<g���
���B�yK1�^�F��g��9�-}�p��������c���K����ϖ��!��I����l][��Ŕp]��8@�b���<�vG�o��������}(T�/'�w�U"������M/Zwy��j�4�L �c_^���^�鐏��	%2��hυ\�RV  ��$�����|_��4�y���}d	�%�O�Tn�)�H@s.�p�3��lY�"B��-���P]��}��z�<��GL��A��[�1���(c��x�b�D���K�!�D7���>G	���z��=	���p9�Т^JrU��5L���85�����ف�ۊ��� �/�ǇqN{0<G@�N�jʪs��c�R�;���a���U��cP((���1{}� ��p���e[>,M����ut��)�όw����;�6&���J�Ο�LK���(qP�d�Mr��!�]	Tf��c��o��{��D����JE��ۥ�^Q�3�W��/�2��SJp\��������?���'�X<0CVe�;���տ;����ݐ���=Y���p���=r@�mEM���{��'Ǉ���g����$��?�d��o �W����:�p�59�=�|J�d����m:�w�݃��5�w�s"DI�qA��L�Sa���5�Du�4��t#�4�+��b����ܗ��n�k����1�߸��9vB��K�ƀ���o�׋�Mx��n�2��I��f�Èx\�� xGCߠ?��{8��/Kl�'���xu �h�/�%�V��|��D    ���C�e��Qŗ��z�=�=�073���Z��b��N�b�)&�IwvA�D[]��[����g���K����^�@���1%�%��Ң�$*��A�
U.̤����A~�~��]��&Ǻ2�­Q5�kZ/h���:y��R�^�-+�3��]&쒯�r�� ���<�W�Qi�x����%��Zyd2;��Ķ�ߪG�/��ٚ�/��/�-�D%����h}� )>y�n!K�� bk`�2�njj��_n���^�s�AC
��ү2�@��c�������DW�r��
�(�8�{� ���s��[�y,����CBo�K�%G/G��kOc%�̟]�#*;�"uX��yus����$�x��j�Dx�barc�ŕ� !Q��FJ1�-;x��$C8`d��e��R����o	c�>r<���R�nĳ$�\r\��c\3M]�Y��a��>ÆK�����E���7�2+�����mA���\*���9��v˰��M�?N�r�s~w'�׈�]f_=۸�%\+?��S:�z0r�����8^�ㅵ!��a��&�$n�%i��x�Y�����2 ^d��T�朶��|�Gq:
���@Nz�R�U�6P�?(�m���~1 ��=����u4Q�Ԇ��D�ĝ�3�pY��"�����B���������/&�T���8h�WP�(1D�Q�<�\ ����2"�X��p�G����Oc��Wܭx���TL5 �$�?��6����lS�z�2����W?R�1<��r�>�����O;����u`��x�P�1��KW�1}&M�0���U5��3��t�ާwS~]��Ly���L0��N�4#�(��c�݈ƛh���_�у�G @~H���s����n���Ӝ�/�+�H��Z3�]�6'��FJ1��U�Z�g
�F�d�d���n��(�qˉ�C�%�Kȸ��y5&���I9��: (��rĭt�d�����#�fqAH�[t)�j�"
�N���'��"����CG��E]w�~]]^#���ƴy���5��%N`k�@s��.,��a�=Y�'Ӌ6��r�O���W��R{��#F/H��f+5ᩥH�DC�4�L��Xx�7�K��i���6�ߝ,��``h?/tē���}�I|o�{������������aK ����7��Ⱦ>���ۨ`?0��E}�9׸�ԘQy!�'t�Ī�X6"��W{�h�>�a����zJ��3s��{Xv��2^v:�k��Du�<��ޥ�8����ǈ��㴗�(��*���$�'���]g�����S4n9�F�1yl93���Z���p���������XU��e�-���udb4�[g�b
�"p�&�!�U�i�s��2��ە��2��`���oj}�F��zz>Lw��5� �9n�yP0���o\�+�'��+�?���n�`��-E�m��K�C&K#8�wɈ.����k�_��O_L �;?��ջ��60�s�*R�1S�C�⌰=�#�� ���ߧ E}C�� �`�vl���3(�%�np�܆�	$&��Yh53��Jn"�U�}�	����$0�"�aG�$�ͷ�$��V����V!�ЀA{�ԃ>�DB�Bs4\��.򻯼����
�3��ݟ�#��D� 8� �u�Rb�rw�������g1��% ����S�w���GO�y���m"��5��U���r<����U��$����;��V�.�.R�X_�Se�e��u<��2�WH�.�dD��9� �P�w��=�[5���i�)�/~S�����W�Ɉ���$2ݨ	{M�&ؗ��"
�?�a��J�ṇ5��9����×ǒ���t/H��u�-��m�O�}\ �W���ɤ�uT��ujLSo4E4Ҟ�N��Q�� R���V��
���{��Ҝ���?]���z���Z:C�8˚��<�3g|���`�;7>�Sd��eg!{�dW��Q�ZUJZ�:\:����k�\����d�k����8���I8��i�u�:X"S�ܢ���;_�&���X:-Ŭ+J���딈o���0B{�r��}t��	�����XT<�_Z�#k����2^���A�=>��HM]�̉k.1Ӆ�C�J8c�PCH�k���z�0T&*�>���}��g��%,E�����1`iQ�� ���J�@ߏ�wǶ���8������.�I�O*�f[��t�=/{h�	�vt \b8}�H��2���p|k	�OZ���8�� �Uc�-�,�F�4��c\"����Z�-��)X����`��H~}O�M���g-S�p��򠈊�f��1��W��p$Mo��
��e_�K�5��	)���#{7�c�X�1� /쪦�f���oQ��R�"�����}�����|�P�:�atU,�xs($|�m��Z��*�˜�M�d}��Fc|I��A��7���ʯ9ȓ�	���~��e�Pt�>D*lI[�r���(ҊWig�`_k��o"��S`a9Td�D�v�4��0>k�>M�?���LTYr����M���f��2�I���"]\���� fణ���G�Q�x�����ɡ���Vi�/��ϓ�+!����xZ ��I �z�Z�e�b�]#�\�Õ;�%G\Wk&�x����?C��Z�9"K�g�M�G���@����7u/Cd��^�z�I9����<���[5�a� �j��G��@n�(+�ˤ�m^��|��W$!�<ge��Ὺ=������˽�.�y:U/ps?GB&�@,m)1rΉ�l��v��p_��5P�����Z����C�hZa�r䤢��^���g���`8 hW�ۛ�~�������jp=? )�#��_�,��h��M��Drqc���C�Q	u���������	���&-�x{R�� c����-��ؖ��?�N&*mD%�����槯M���AB+�K�n/����V �	�n��-N�3Y��=��z�9���"_�m�-�g[�nse��M��T*��WB����~�Ӗɡq&�����Mk�m��*�K�I��m����]rl�::&�cJ0T��y>v �1�&��Qޣ)�[�{U���'d�p��J"��1�����|��U�������]ʢ�Zsؑ����&[\���LU�f�0n�A]��0l�����Rur<?JUO����[����|����FE��Ơ��ż6ϖ��2N����F)��^�Qc�^�ƌ����_�/_｝c���5#�Ldռ��ㇲ@�}������2�F��`�byY�4G~ž��x?4涗��������.��쑧lvMH���Q��=�>D�mOrq��?���;Gf��:��gL�Ż�i��wk	�7�rw�q���}�z@&D�E��{����؏�?cF����6�N�б��a!�P~��:�l)F�ym�����|@�2:���`ͧBb��a&X��]���91��]�^�@����9^��$~�M�D��t� ;Y�F�����F�X����,9��;/��!�T�����iM�������Q�9�&��O�T��P���EH(��:�%�SO�~��u����0�����R��f�P[L�).�Q#6�U��%�̙W��Є��(�Po���ΗK����U6��}����f���N���������ri��V�U"�rr�q�$�+��Ǥ��s�e&Tv6��2�����Wj=|q�I�se1`])u{��^N|�J����k���S��r4� QGZ��	�+ �f)� ��œ��}9�����O� *��]6��{9Q)j��_Mm=VQ�0Jke4�dW����0�{�c��?�u�%�aq>��@��{IEH���8������ё�W�sӷ��m�>�?�A���Uv	�C�p-wlNw�x%��X�L�uc���2�e����uC#�#�t�O݈�8�
�]㤧<j�>	f�\��$��0�]cÓ)�L�������sj�$���0W��{��&��X��)<��3ѓ�    �η��"���E����-�#�*�t��;��)*k���x`KB I�n���:z|b-����_nM����?^����STp97���xy�~F½�mn �qތ����	���C
m����/�&>?7ފ]�21*��dYW�Ⱦ�Ʌ�"ZH=v���0��d���ۡ��x6;��{1Xub�@F�.�~��^"�WJv�9�L��^i������(�8������=C]��#����'`l��:#gR�����:��0���yܑ�/�Ͻ�0��֕:vF�ꐀP�\��w �5�/�Ƌ���}���W��_�.��s����+ɗ7�|��=֥VtU{בs$oo������A4q�3vB�F���孰�*D�2��(N94y/���Gy��9̳+o�sUCv6����ӱo�s�!�qU�ʰ�5+y����q�8<����}pD=�1wL��7:�1�~����4���"U -��6�1���\u��_�֢/	�=�Y\ȓ��>�����e
.>?V�Q�[	5)d+��\��	���X�T�y� O-ϑ{I"�ݻ!�k�}��w%��S�e���}� ��#�6}j.׻�ny��'-�������>�0���������m�E��5!n5q���Ѥ���=[/<��.�� ��ݵ~s�8�c��候g��1�$��N.�!�F����%d�Hmn�i�X�(�YR�[�~s���?�$`�fтs�7�"q���{��	0��0�D�[	��2[�K������?%�����Z?��߲N�E#�p�4xy�9N�.T������+`�7�/�U��翡�w/+�9�H9т�s0*���`5��_r�g-��ӛ�\4U�+1�׉���o��J�m�>���CX r�,�-�G�2�[��׹v��o�U��e����T���X���%�DFDGӑ��,y�׌�(����34�� A~����w��yEM�O���:%��xsU���@����B���ɶ[k���)��?���C��5�k���F.$��\�È�	�?K*�i7��f#�<o�.�K?��?�NP�nQ�@����m�;G��z��[�=7��<��9]gW�l'�/6}\Y94h�Lz���� m���#�����eh�n[#��y�g�}�@��q/7���:�Tΐ�n�����c�{�t�t�b��L�і�����>.�^��ǱbO��#9�K;�D����B��B��j.��.�Wsp!+�������T��$�K��|�H���+]Q�����[\ءy�@�ĜOhN_��fFa��2 �n���(x�<{-(ˮ����/'[��x�dw�榴�)��3�cjǁAgV�9���뭟�6�r���	(� ר�`KN�K��:4�1����лt�UVu�ս_�i�6Ջ?]��sL��u�GP�tZ���t�<��U��^-N:Q�q���]��<�3/���W�=��]J"�������=�#$j�/5a{��-���)�qo}��w�q����c����M@ǆ'��v���4�o�vL^���}��!
G�}}Ϣ�D>c��=���gYI��̦���0�T"09��� ����?�nz~���8�ޏP0U)<S������y�@W'�$a��ִHd�Fw)��X����0$C�����<
@u�E�]���<�B�7P���e`<�o��Ǯ2T-��G��{~�>�M���N+�(h����*$շ��"��CG���3�MO�R��=~�_���z�&�~�N.���,�Bc��)0Q~�#R|�M�l/�%?ǤϡX�2uw�s�I<��A�X3��/B�T)"�`_ו��P �-��W��9���E�-�ǐ0�<��u��&��!���(�@]�KoGFXcd��)�/X��j>ݮL?�Z�r�rN�$���sc�¸��Yd��R,Be�jw���R[�Hڜ�][fCk1l�����a?8�`���`��Q�Dٗ���g|5��8F�`O�>Rʸt�ݮGTx�B��VO�����>"��%���r��g�DNC�j�������૬�d����4k���[k�7���������U��[��b=���7��l�#j����򎕞��^�<3d�OZ����k��������&�x"9��=����cq�̉�����+c<�N����7�x�����0�T�q����BH�T����ΤKQX��k�[��{fv��̣�y�Y&D��/h��}���\�Hr�{�?$a�$$rC�Y��1s��N2V̀r�������p�5{HQ����l,�s���s㙞�IB;X�F/�B>7:?A��̈́f�gf-�-�)t��f����w����w1)�G.Z�Ӭ���#)v���GH��L��}א��� ��վ�O=�.Jx�Y�r�҇�X���dlCMԥ>��S���P�2^VUF���o�_�@Uf)K��!ƇVU�A�4��X�Ñ�)�/�{ʹ=�݉��D�t|���h� ��mi}j-�F)
4���5:t��<rA����k�vw�:�.���#S�fU�j�)�l�?/��^xg��e��R׾'�YT���|V�ϽJ�rI��Fmn���mo�o?�C�5�Bwvc}�
 �`MS�)p�4�%M��gwv���Jh�M��V���s{�QS��:"������;V�9	,*��3�}Ȅ���6ݕT-L�}Q����Q�*���E){�*�pX]���F߂lϊ�c�n��ש[?�`F�P+d���bX� ��$�ӥ!�����Wm�����r$u��z@���ńl.ρ_cC�-����ר��pN�˲�t�oh�E��|�0��;p�so��2R����o�"�Ӫ���u!�
ı�{��t���P�ô�wOφ��ᾣT�@�74'#d�AQ��ke���	�d=n!H��3*�ºA�qsaAޏݝ�}K{VM4�ĳ3��Ϗd'A��_�0�w�N�X���D�b��)\��Z��%���H^�b{��#lv~�>���-��: �ټ����i�{19��2����U��k���c�t��Y#;=�)t\�)��{k�E����"b�)FcW������Kd�޵��(�6�)���c$�Q�k��{��eg�A��˿|�ᅔYf'��U�Ӌ�[��K����5Ռ<��E�u��fz�pZy@��{5?��1��	���j�7��4��~l�� �W\�O�)ά2�%al;�.����݈ ��.�?�ž��Xi��瞭�u�$*�,Mb;Q�R9�\��A>��6�*�
��d����	�A������
7�$ж>����m�d)�3`����<��#Z���v�o����Q�ܬ��N��Q��Y���ڼ��CZ�����+9����w=���������9;!� �ER���@����z��;_�A�7%=y��hp��z�ΠM�|�c���A�i�bQB�a�8�\w��p�JC9���`D����@����Q�K�p?c��˛2�o+��4�6��ܡ�t��C#:b a<�ƾ`����<CuB��R�!��EhFW	и��
}�y�^�y�_�.�zlk|��c�4$J��P��}>��;�����'�7_�������G*�&?,{M�3���t�{�'Z�#�=v�%��n(�[6RX+N�\Ӫn^��n�>��>K��snRN����ꫧG_N̝�Qn�H�r�L=���@�'e�>�'m�x��u�`z�]�~�����/d<�71ƌ�*-v�O�.�z �Ȏ�t���ЄP�}{���^���l��+>�3|���5��n�p���!XM�i��&��G�L�sC�@x] �3�Sܧ�k��3�,O�v�1�^Z�Xv1.r�Ҋ�����X3.+�8"� sv~���^|�  W:����c��W�_�	�޾?"N5f�9 /��Two�3$���+��ɔ)��d�������'/�Dwt�v��~A�<�E�r�'{X�JkI˹L2�y�+���|qV,��+�*�>��� �  f����U�+�1^/��I��25�\R�� ��\�2ޭ�����J%6���ͧ�ǽ	�w]���*�\�	FQ����[j���2�,fQ+���u��	���z���[���2 �2���Ί#��J�"��)[�F��P�&0,�J���:0�g�~Ba�.�5��{b���FE8�LX�S(K�����-Y^���a��|�2��SP��H���0���]��̲��f�%��{�bx�
&�r��ȟߌ�p2���o�ML����*�3�����rL�O��	Ck�)�X�(�Ǳ3����?�
:i��}������ac�P�H���Z�En�wϝ|7
ˈ�p��B�CV ����-~� d1.����/*���^G��{�-
�nƱ-[�א��`n�Y�`��}}}���     