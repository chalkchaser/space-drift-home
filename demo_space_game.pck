GDPC                                                                             "   H   res://.import/bullet_simple.png-b36b9018f725e637fb078fca0b135bd4.stex   �+      {       �o�R����<r�a>�!D   res://.import/eneny_nash.png-d1ba76de51d2d4e5e2a3ebd8a0611e45.stex  �/      g      �ʅ$g<1:��[�<��#<   res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex�3      �      �p��<f��r�g��.�@   res://.import/mouse.png-696f4cca1b0bcc26fbe121cf2289b53b.stex   �C            �w8=�n"����f��L   res://.import/player_left_standing.png-a41f4f7fbdbc36ca97628bd45da6ced0.stexPG      Y      i�mKqJ�Hw����L   res://.import/weapon_gun_simple.png-667731ecc91c366c6442e7d6309ec929.stex   pK      �       0}����#=#<�   res://Bullet.gd.remap   �N      !       טdZ�=���B!��q'5   res://Bullet.gdcP	            ��m��} Z�˛p@uc   res://Bullet.tscn   p            K�H�Jj`-�+K��^w   res://CamaraObject.gd.remap  O      '       ��A37D�#���q=f�U   res://CamaraObject.gdc  �      �      m>�	3A/��T*뀒   res://Camera2D.gd.remap 0O      #       xmé�!�M�(V��   res://Camera2D.gdc  p      u       =v<w���P�g|�b��S   res://Demo.gd.remap `O             �j<������v   res://Demo.gdc  �      8       m�C�$��K�G��r   res://Demo.tscn 0      �      #��ˠ �*0q�Q��   res://Player.gd.remap   �O      !       ��0�F �qq��dX��   res://Player.gdc0      �      cMQ�����%��*��   res://Player.tscn   �      �      ����+�%��9�<	   res://Position2D.gd.remap   �O      %       �H��*1bUA�;Z�	   res://Position2D.gdcp      �      ��S(h�����:��   res://TimeExample.gd.remap  �O      &       LԣO���p:۬��   res://TimeExample.gdc   p!      �      0э:�:H����&���   res://Weapon.gd.remap   P      !       qds$���{�)�>��   res://Weapon.gdc #      �      %T`�l�y� sB�?��4    res://bullet_simple.png.import  0,      �      �����ѩ��عus   res://default_env.tres  �.      �       um�`�N��<*ỳ�8   res://eneny_nash.png.import �0      �      ��γ� 2k�K��   res://icon.png  @P      i      ����󈘥Ey��
�   res://icon.png.import   0A      �      �����%��(#AB�   res://mouse.png.import  �D      �      �nXSq������\4�(   res://player_left_standing.png.import   �H      �      ���fn,���i����   res://project.binary�]      �      8�b@B0�H���/�-$   res://weapon_gun_simple.png.import   L      �      �E�`�ah����-��    GDSC            m      ��������τ�   ����Ķ��   �����������Ӷ���   ����Ӷ��   �����϶�   ����Ķ��   ����   �����������¶���   ������������Ӷ��   ������¶   ��������Ҷ��   ����¶��   ��������������������Ӷ��   �������Ŷ���   ����׶��   ���������Ӷ�                      timeout       _on_time_out_complete                                                              	      
         $      +      2      =      B      H      J      K      Q      U      V      W      X      Y      `      h      3YYYYY;�  Y;�  �  Y;�  �  YY0�  PQV�  �  �  T�  PQ�  �  T�  P�  Q�  �  T�  P�  Q�  �  T�	  P�  RR�  Q�  �
  P�  Q�  �  T�  PQ�  -YY0�  PQV�  �  �  �  �  YYY0�  P�  QV�  &P�  �  QV�  �  PQ`  [gd_scene load_steps=4 format=2]

[ext_resource path="res://Bullet.gd" type="Script" id=1]
[ext_resource path="res://bullet_simple.png" type="Texture" id=2]

[sub_resource type="CircleShape2D" id=1]

[node name="bullet" type="RigidBody2D"]
mass = 0.00102041
script = ExtResource( 1 )

[node name="Sprite" type="Sprite" parent="."]
position = Vector2( -0.00129472, 0.0366948 )
texture = ExtResource( 2 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
scale = Vector2( 0.2, 0.2 )
shape = SubResource( 1 )
     GDSC            r      ���ӄ�   �������������ض�   �����Ķ�   ���������¶�   �������Ӷ���   ���������޶�   ���������޶�   ��������������޶   �����϶�   �������Ŷ���   ����׶��   ������������������������ض��   �������ض���   ζ��   ϶��   �����������������Ӷ�      Player                 �      F     �������?                                                 "   	   $   
   %      &      '      .      4      H      \      e      p      3YY;�  Y5;�  �  PQT�  PQY;�  Y;�  Y;�  Y0�  PQV�  -YYYY0�	  P�
  QV�  �  �  PQ�  �  P�  �  T�  T�  �  T�  Q�  �  �  �  P�  �  T�  T�  �  T�  Q�  �  �  �  �  P�  R�  Q�  �  �  T�  P�  R�  QY`           GDSC             
      �����ׄ򶶶�                                                 3YYYYYY�  `           GDSC                   ����ڶ��             3Y`        [gd_scene load_steps=4 format=2]

[ext_resource path="res://Player.tscn" type="PackedScene" id=1]
[ext_resource path="res://icon.png" type="Texture" id=2]
[ext_resource path="res://CamaraObject.gd" type="Script" id=3]

[node name="DemoStage" type="Node"]

[node name="Player" parent="." instance=ExtResource( 1 )]
position = Vector2( 161.912, 73.2802 )

[node name="icon" type="Sprite" parent="."]
position = Vector2( 176.346, 101.435 )
scale = Vector2( 0.383653, 0.366766 )
texture = ExtResource( 2 )

[node name="CamaraObject" type="Node2D" parent="."]
script = ExtResource( 3 )

[node name="Camera2D" type="Camera2D" parent="CamaraObject"]
position = Vector2( 161.912, 73.2802 )
current = true
drag_margin_h_enabled = false
drag_margin_v_enabled = false
           GDSC      
   &   �      ���ׄ�   ����Ҷ��   ������������ζ��   ������������϶��   ������Ҷ   �����϶�   �������Ŷ���   ����׶��   �������϶���   ������������������������ض��   ζ��   �������ض���   ����¶��   ����������������Ҷ��   ϶��   �����޶�   ���������Ҷ�   �������������Ӷ�   ���϶���   ���ƶ���   �����޶�   t      �      @               ui_left             ui_up         ui_down       ui_right                                                           	      
               #      %      &      '      .      5      A      B      K      Q      Z      `      i      o      x      ~      �      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &   3YYYYY8;�  Y;�  �  Y;�  �  Y;�  �  YYY0�  PQV�  -YYY0�  P�  QV�  ;�  �  PQ�  �  �	  PQT�
  �  T�
  �  �  &�  T�  P�  QV�  �  T�
  �  �  &�  T�  P�  QV�  �  T�  �  �  &�  T�  P�  QV�  �  T�  �  �  &�  T�  P�  QV�  �  T�
  �  �  &�  T�  PQ�	  V�  �  �  T�  PQ�  �  W�  T�  PQ�  (VW�  T�  PQ�  �  �  �  �  W�  T�  P�  QYY�  �  Y`           [gd_scene load_steps=9 format=2]

[ext_resource path="res://Player.gd" type="Script" id=1]
[ext_resource path="res://player_left_standing.png" type="Texture" id=2]
[ext_resource path="res://eneny_nash.png" type="Texture" id=3]
[ext_resource path="res://Position2D.gd" type="Script" id=4]
[ext_resource path="res://Weapon.gd" type="Script" id=5]
[ext_resource path="res://weapon_gun_simple.png" type="Texture" id=6]

[sub_resource type="SpriteFrames" id=1]
animations = [ {
"frames": [ ExtResource( 2 ), ExtResource( 3 ) ],
"loop": true,
"name": "left_facing",
"speed": 5.0
} ]

[sub_resource type="RectangleShape2D" id=2]
extents = Vector2( 2.97297, 12.0931 )

[node name="Player" type="Area2D"]
position = Vector2( 156.231, 62.5805 )
script = ExtResource( 1 )

[node name="AnimatedSprite" type="AnimatedSprite" parent="."]
position = Vector2( 0.0221214, -0.00197601 )
z_index = 1
frames = SubResource( 1 )
animation = "left_facing"
offset = Vector2( 0, 2 )

[node name="CollisionShape2D" type="CollisionShape2D" parent="."]
position = Vector2( 0.0425835, 0.464869 )
shape = SubResource( 2 )

[node name="Position2D" type="Position2D" parent="."]
script = ExtResource( 4 )

[node name="Weapon" type="Node" parent="Position2D"]
script = ExtResource( 5 )

[node name="Sprite" type="Sprite" parent="Position2D/Weapon"]
position = Vector2( 28.6588, 32.2913 )
texture = ExtResource( 6 )
centered = false
offset = Vector2( 0, -6 )
               GDSC            B      �������؄�   ��������������ض   �����������������Ķ�   �����϶�   �������Ŷ���   ����׶��   ���������¶�   ������������������ض   �������ض���   ������������������������ض��   ���������Ҷ�                                           	               	      
                            *      +      ?      @      3YYYYY;�  Y;�  YY0�  PQV�  -YYY0�  P�  QV�  �  �  PQT�  PQ�  �  �  P�  PQT�	  PQ�  QT�
  PQ�  YY`            GDSC            3      ���Ӷ���   �����϶�   ����Ķ��   ������¶   ����������������¶��   �����Ӷ�   ������Ӷ      timeout       _on_Timer_timeout                                                       	      
                                        &      1      3YYYYYYY0�  PQV�  W�  T�  PRR�  QYYYYYYY0�  PQV�  W�  T�  W�  T�  Y`        GDSC   )      8   �     ���Ӷ���   ���������Ҷ�   ��������������ض   �����¶�   ����������Ķ   ����������϶   ��������¶��   �����϶�   ����Ķ��   ����   �����������¶���   ������������Ӷ��   ������¶   ��������Ҷ��   �������Ŷ���   ����׶��   ����¶��   ����������������Ҷ��   �����¶�   �������Ӷ���   �������ض���   ���������¶�   ������������������ض   ��������϶��   ��������϶��   ������������������������ض��   ���������������Ķ���   ����������Ķ   ������Ŷ   ζ��   ϶��   �������ض���   ������ζ   ��������   ������Ҷ   ��������������������Ӷ��   ���������¶�   �������Ӷ���   ������������Ӷ��   ���������Ҷ�   ����¶��   �         res://Bullet.tscn         �������?            timeout       _on_time_out_complete         ui_left_mouse_click       Sprite                                                     	                           	       
   %      &      ,      4      ;      B      M      R      S      T      U      V      W      ^      _      h      l      {      |      �      �      �       �   !   �   "   �   #   �   $   �   %   �   &     '     (     )     *   +  +   ,  ,   -  -   .  .   4  /   8  0   9  1   ?  2   E  3   N  4   [  5   e  6   �  7   �  8   3YYY;�  Y;�  Y5;�  �E  P�  QYY;�  �  Y;�  �  Y;�  �  YY0�  PQV�  �  �  T�	  PQ�  �  T�
  P�  Q�  �  T�  P�  Q�  �  T�  P�  RR�  Q�  �  P�  QYYY�  �  Y0�  P�  QV�  �  &�  T�  P�  QV�  �  PQ�  �  P�  QT�  �  PQT�  PQ�  �  ;�  �  PQT�  PQT�  PQ�  ;�  �  PQT�  PQ�  ;�  �  �  �  ;�  �  P�	  R�
  Q�  ;�  P�  T�  �  T�  �  T�  �  T�  QP�
  P�  P�  T�  R�  Q�  P�  T�  R�  QQQ�  &P�  T�  �  T�  QV�  �  P�  QT�  P�  P�  QQ�  �  P�  QT�   �  �  (V�  �  P�  QT�  P�  P�  QQ�  �  P�  QT�   �
  �  �8  P�  P�  QQ�  �  �  P�  QT�!  �  PQT�  PQT�"  YY�  Y0�#  PQV�  �  �  YY0�  PQV�  &P�  QV�  ;�$  �  T�%  PQ�  �  PQT�  PQT�  P�$  Q�  �$  T�  �  PQT�  �  �$  T�&  P�  P�
  R�
  QRP�  PQT�  PQ�  PQT�  PQT�  PQQT�'  PQ�  Q�  �  �  �  �  T�(  PQ`        GDST               _   PNG �PNG

   IHDR         ��~   "IDAT�c`���P�������[D�k � I��I�~    IEND�B`�     [remap]

importer="texture"
type="StreamTexture"
path="res://.import/bullet_simple.png-b36b9018f725e637fb078fca0b135bd4.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://bullet_simple.png"
dest_files=[ "res://.import/bullet_simple.png-b36b9018f725e637fb078fca0b135bd4.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
    [gd_resource type="Environment" load_steps=2 format=2]

[sub_resource type="ProceduralSky" id=1]

[resource]
background_mode = 2
background_sky = SubResource( 1 )
             GDST               K  PNG �PNG

   IHDR         ��<�  IDATH���M�0�ߘ�8��e�x�a�	H�k=�`\�N](0m�P_B�L�߼�O����5� ���������N��h}X�533_�AFaAP�?ye{��Ht	 �Uld �l����wdRTy1�ˋ(���b�J�I��Д�ҞC|�1P?�\iJ  w�D@__
�y��{r��ŵҩy�����U)��L���[�i���aJ�G�_�Q��$r
�����Ȍ��M��y�]<	r-��,�� 5�0%��
e��\�yċ����L^�L�    IEND�B`�         [remap]

importer="texture"
type="StreamTexture"
path="res://.import/eneny_nash.png-d1ba76de51d2d4e5e2a3ebd8a0611e45.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://eneny_nash.png"
dest_files=[ "res://.import/eneny_nash.png-d1ba76de51d2d4e5e2a3ebd8a0611e45.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
             GDST@   @           |  PNG �PNG

   IHDR   @   @   �iq�  ?IDATx��{pTU�����;�N7	�����%"fyN�8��r\]fEgةf���X�g��F�Y@Wp\]|,�D@��	$$���	��I�n���ҝt����JW�s��}�=���|�D(���W@T0^����f��	��q!��!i��7�C���V�P4}! ���t�ŀx��dB.��x^��x�ɏN��贚�E�2�Z�R�EP(�6�<0dYF���}^Ѡ�,	�3=�_<��(P&�
tF3j�Q���Q�B�7�3�D�@�G�U��ĠU=� �M2!*��[�ACT(�&�@0hUO�u��U�O�J��^FT(Qit �V!>%���9 J���jv	�R�@&��g���t�5S��A��R��OO^vz�u�L�2�����lM��>tH
�R6��������dk��=b�K�љ�]�י�F*W�볃�\m=�13� �Є,�ˏy��Ic��&G��k�t�M��/Q]�أ]Q^6o��r�h����Lʳpw���,�,���)��O{�:א=]� :LF�[�*���'/���^�d�Pqw�>>��k��G�g���No���\��r����/���q�̾��	�G��O���t%L�:`Ƶww�+���}��ݾ ۿ��SeŔ����  �b⾻ǰ��<n_�G��/��8�Σ�l]z/3��g����sB��tm�tjvw�:��5���l~�O���v��]ǚ��֩=�H	u���54�:�{"������}k����d���^��`�6�ev�#Q$�ήǞ��[�Ặ�e�e��Hqo{�59i˲����O+��e������4�u�r��z�q~8c
 �G���7vr��tZ5�X�7����_qQc�[����uR��?/���+d��x�>r2����P6����`�k��,7�8�ɿ��O<Ė��}AM�E%�;�SI�BF���}��@P�yK�@��_:����R{��C_���9������
M��~����i����������s���������6�,�c�������q�����`����9���W�pXW]���:�n�aұt~9�[���~e�;��f���G���v0ԣ� ݈���y�,��:j%gox�T
�����kְ�����%<��A`���Jk?���� gm���x�*o4����o��.�����逊i�L����>���-���c�����5L����i�}�����4����usB������67��}����Z�ȶ�)+����)+H#ۢ�RK�AW�xww%��5�lfC�A���bP�lf��5����>���`0ċ/oA-�,�]ĝ�$�峋P2/���`���;����[Y��.&�Y�QlM���ƌb+��,�s�[��S ��}<;���]�:��y��1>'�AMm����7q���RY%9)���ȡI�]>�_l�C����-z�� ;>�-g�dt5іT�Aͺy�2w9���d�T��J�}u�}���X�Ks���<@��t��ebL������w�aw�N����c����F���3
�2먭�e���PQ�s�`��m<1u8�3�#����XMڈe�3�yb�p�m��܇+��x�%O?CmM-Yf��(�K�h�بU1%?I�X�r��� ��n^y�U�����1�玒�6..e��RJrRz�Oc������ʫ��]9���ZV�\�$IL�OŨ��{��M�p�L56��Wy��J�R{���FDA@
��^�y�������l6���{�=��ή�V�hM�V���JK��:��\�+��@�l/���ʧ����pQ��������׷Q^^�(�T������|.���9�?I�M���>���5�f欙X�VƎ-f͚ո���9����=�m���Y���c��Z�̚5��k~���gHHR�Ls/l9²���+ ����:��杧��"9�@��ad�ŝ��ѽ�Y���]O�W_�`Ֆ#Դ8�z��5-N^�r�Z����h���ʆY���=�`�M���Ty�l���.	�/z��fH���������֗�H�9�f������G� ̛<��q��|�]>ں}�N�3�;i�r"�(2RtY���4X���F�
�����8 �[�\锰�b`�0s�:���v���2�f��k�Zp��Ω&G���=��6em.mN�o.u�fԐc��i����C���u=~{�����a^�UH������¡,�t(jy�Q�ɋ����5�Gaw��/�Kv?�|K��(��SF�h�����V��xȩ2St쯹���{6b�M/�t��@0�{�Ԫ�"�v7�Q�A�(�ľR�<	�w�H1D�|8�]�]�Ո%����jҢ꯸hs�"~꯸P�B�� �%I}}��+f�����O�cg�3rd���P�������qIڻ]�h�c9��xh )z5��� �ƾ"1:3���j���'1;��#U�失g���0I}�u3.)@�Q�A�ĠQ`I�`�(1h��t*�:�>'��&v��!I?�/.)@�S�%q�\���l�TWq�������լ�G�5zy6w��[��5�r���L`�^���/x}�>��t4���cݦ�(�H�g��C�EA�g�)�Hfݦ��5�;q-���?ư�4�����K����XQ*�av�F��������񵏷�;>��l�\F��Þs�c�hL�5�G�c�������=q�P����E �.���'��8Us�{Ǎ���#������q�HDA`b��%����F�hog���|�������]K�n��UJ�}������Dk��g��8q���&G����A�RP�e�$'�i��I3j�w8������?�G�&<	&䪬R��lb1�J����B$�9�꤮�ES���[�������8�]��I�B!
�T
L:5�����d���K30"-	�(��D5�v��#U�����jԔ�QR�GIaó�I3�nJVk���&'��q����ux��AP<�"�Q�����H�`Jң�jP(D��]�����`0��+�p�inm�r�)��,^�_�rI�,��H>?M-44���x���"� �H�T��zIty����^B�.��%9?E����П�($@H!�D��#m�e���vB(��t �2.��8!���s2Tʡ �N;>w'����dq�"�2����O�9$�P	<(��z�Ff�<�z�N��/yD�t�/?�B.��A��>��i%�ǋ"�p n� ���]~!�W�J���a�q!n��V X*�c �TJT*%�6�<d[�    IEND�B`�        [remap]

importer="texture"
type="StreamTexture"
path="res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://icon.png"
dest_files=[ "res://.import/icon.png-487276ed1e3a0c39cad0279d744ee560.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
GDST              �   PNG �PNG

   IHDR         ���   �IDAT8��TA� �״}������=����۝��3�(@�!�Z��g/���T�@�%�n�R��[���U�=�o�Z����H�T4�e�Ͻ�e�n�i]�1U�f���Q�lf����>����=n�/O���	v�R��;�[7P��wzwX_���l�>!�H�B?;�x��xz'    IEND�B`�          [remap]

importer="texture"
type="StreamTexture"
path="res://.import/mouse.png-696f4cca1b0bcc26fbe121cf2289b53b.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://mouse.png"
dest_files=[ "res://.import/mouse.png-696f4cca1b0bcc26fbe121cf2289b53b.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=true
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
             GDST               =  PNG �PNG

   IHDR         ��<�   IDATH��T�	�0U��cf0d���5���r	4g�Bg�1��X�G�]
��>0�Bzzz6�#�"8��I.Q�{�l��rvB����"B?�Q�r>�d�"��-"���b�8E��e�h�����F���U佋ǭ ���u��w� �ug�����	�0Mi�9�hv��XYDug<����lf/G|��kug�̍� �6�tl4����"�`;��-�?%E�(T�-E`!^?��W ��ž�(4:������Xl�r���    IEND�B`�       [remap]

importer="texture"
type="StreamTexture"
path="res://.import/player_left_standing.png-a41f4f7fbdbc36ca97628bd45da6ced0.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://player_left_standing.png"
dest_files=[ "res://.import/player_left_standing.png-a41f4f7fbdbc36ca97628bd45da6ced0.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
               GDST               �   PNG �PNG

   IHDR         �B��   IIDAT(�c`y�����?yܒ=�ױj.��I���A����ฎ�f���k3.🁁�?�U8g��M8m���  �O�?�j    IEND�B`�              [remap]

importer="texture"
type="StreamTexture"
path="res://.import/weapon_gun_simple.png-667731ecc91c366c6442e7d6309ec929.stex"
metadata={
"vram_texture": false
}

[deps]

source_file="res://weapon_gun_simple.png"
dest_files=[ "res://.import/weapon_gun_simple.png-667731ecc91c366c6442e7d6309ec929.stex" ]

[params]

compress/mode=0
compress/lossy_quality=0.7
compress/hdr_mode=0
compress/bptc_ldr=0
compress/normal_map=0
flags/repeat=0
flags/filter=false
flags/mipmaps=false
flags/anisotropic=false
flags/srgb=2
process/fix_alpha_border=true
process/premult_alpha=false
process/HDR_as_SRGB=false
process/invert_color=false
stream=false
size_limit=0
detect_3d=true
svg/scale=1.0
        [remap]

path="res://Bullet.gdc"
               [remap]

path="res://CamaraObject.gdc"
         [remap]

path="res://Camera2D.gdc"
             [remap]

path="res://Demo.gdc"
 [remap]

path="res://Player.gdc"
               [remap]

path="res://Position2D.gdc"
           [remap]

path="res://TimeExample.gdc"
          [remap]

path="res://Weapon.gdc"
               �PNG

   IHDR   @   @   �iq�  0IDATx��}pTU����L����W�$�@HA�%"fa��Yw�)��A��Egةf���X�g˱��tQ���Eq�!�|K�@BHH:�t>�;�����1!ݝn�A�_UWw����{λ��sϽO�q汤��X,�q�z�<�q{cG.;��]�_�`9s��|o���:��1�E�V� ~=�	��ݮ����g[N�u�5$M��NI��-
�"(U*��@��"oqdYF�y�x�N�e�2���s����KҦ`L��Z)=,�Z}"
�A�n{�A@%$��R���F@�$m������[��H���"�VoD��v����Kw�d��v	�D�$>	�J��;�<�()P�� �F��
�< �R����&�կ��� ����������%�u̚VLNfڠus2�̚VL�~�>���mOMJ���J'R��������X����׬X�Ϲ虾��6Pq������j���S?�1@gL���±����(�2A�l��h��õm��Nb�l_�U���+����_����p�)9&&e)�0 �2{��������1���@LG�A��+���d�W|x�2-����Fk7�2x��y,_�_��}z��rzy��%n�-]l����L��;
�s���:��1�sL0�ڳ���X����m_]���BJ��im�  �d��I��Pq���N'�����lYz7�����}1�sL��v�UIX���<��Ó3���}���nvk)[����+bj�[���k�������cݮ��4t:= $h�4w:qz|A��٧�XSt�zn{�&��õmQ���+�^�j�*��S��e���o�V,	��q=Y�)hԪ��F5~����h�4 *�T�o��R���z�o)��W�]�Sm銺#�Qm�]�c�����v��JO��?D��B v|z�կ��܈�'�z6?[� ���p�X<-���o%�32����Ρz�>��5�BYX2���ʦ�b��>ǣ������SI,�6���|���iXYQ���U�҅e�9ma��:d`�iO����{��|��~����!+��Ϧ�u�n��7���t>�l捊Z�7�nвta�Z���Ae:��F���g�.~����_y^���K�5��.2�Zt*�{ܔ���G��6�Y����|%�M	���NPV.]��P���3�8g���COTy�� ����AP({�>�"/��g�0��<^��K���V����ϫ�zG�3K��k���t����)�������6���a�5��62Mq����oeJ�R�4�q�%|�� ������z���ä�>���0�T,��ǩ�����"lݰ���<��fT����IrX>� � ��K��q�}4���ʋo�dJ��م�X�sؘ]hfJ�����Ŧ�A�Gm߽�g����YG��X0u$�Y�u*jZl|p������*�Jd~qcR�����λ�.�
�r�4���zپ;��AD�eЪU��R�:��I���@�.��&3}l
o�坃7��ZX��O�� 2v����3��O���j�t	�W�0�n5����#è����%?}����`9۶n���7"!�uf��A�l܈�>��[�2��r��b�O�������gg�E��PyX�Q2-7���ʕ������p��+���~f��;����T	�*�(+q@���f��ϫ����ѓ���a��U�\.��&��}�=dd'�p�l�e@y��
r�����zDA@����9�:��8�Y,�����=�l�֮��F|kM�R��GJK��*�V_k+��P�,N.�9��K~~~�HYY��O��k���Q�����|rss�����1��ILN��~�YDV��-s�lfB֬Y�#.�=�>���G\k֬fB�f3��?��k~���f�IR�lS'�m>²9y���+ �v��y��M;NlF���A���w���w�b���Л�j�d��#T��b���e��[l<��(Z�D�NMC���k|Zi�������Ɗl��@�1��v��Щ�!曣�n��S������<@̠7�w�4X�D<A`�ԑ�ML����jw���c��8��ES��X��������ƤS�~�׾�%n�@��( Zm\�raҩ���x��_���n�n���2&d(�6�,8^o�TcG���3���emv7m6g.w��W�e
�h���|��Wy��~���̽�!c� �ݟO�)|�6#?�%�,O֫9y������w��{r�2e��7Dl �ׇB�2�@���ĬD4J)�&�$
�HԲ��
/�߹�m��<JF'!�>���S��PJ"V5!�A�(��F>SD�ۻ�$�B/>lΞ�.Ϭ�?p�l6h�D��+v�l�+v$Q�B0ūz����aԩh�|9�p����cƄ,��=Z�����������Dc��,P��� $ƩЩ�]��o+�F$p�|uM���8R��L�0�@e'���M�]^��jt*:��)^�N�@�V`�*�js�up��X�n���tt{�t:�����\�]>�n/W�\|q.x��0���D-���T��7G5jzi���[��4�r���Ij������p�=a�G�5���ͺ��S���/��#�B�EA�s�)HO`���U�/QM���cdz
�,�!�(���g�m+<R��?�-`�4^}�#>�<��mp��Op{�,[<��iz^�s�cü-�;���쾱d����xk瞨eH)��x@���h�ɪZNU_��cxx�hƤ�cwzi�p]��Q��cbɽcx��t�����M|�����x�=S�N���
Ͽ�Ee3HL�����gg,���NecG�S_ѠQJf(�Jd�4R�j��6�|�6��s<Q��N0&Ge
��Ʌ��,ᮢ$I�痹�j���Nc���'�N�n�=>|~�G��2�)�D�R U���&ՠ!#1���S�D��Ǘ'��ೃT��E�7��F��(?�����s��F��pC�Z�:�m�p�l-'�j9QU��:��a3@0�*%�#�)&�q�i�H��1�'��vv���q8]t�4����j��t-}IـxY�����C}c��-�"?Z�o�8�4Ⱦ���J]/�v�g���Cȷ2]�.�Ǣ ��Ս�{0
�>/^W7�_�����mV铲�
i���FR��$>��}^��dُ�۵�����%��*C�'�x�d9��v�ߏ � ���ۣ�Wg=N�n�~������/�}�_��M��[���uR�N���(E�	� ������z��~���.m9w����c����
�?���{�    IEND�B`�       ECFG      _global_script_classes             _global_script_class_icons             application/config/name         spacetraderogue    application/run/main_scene         res://Demo.tscn    application/config/icon         res://icon.png     display/window/size/width      @     display/window/size/height      �      display/window/stretch/mode         2d     display/window/stretch/aspect         keep   input/ui_accept�              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode          unicode           echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index          pressure          pressed           script            input/ui_left\              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   A      unicode           echo          script            input/ui_right\              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   D      unicode           echo          script            input/ui_up\              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   W      unicode           echo          script            input/ui_down\              deadzone      ?      events              InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode        unicode           echo          script               InputEventJoypadButton        resource_local_to_scene           resource_name             device            button_index         pressure          pressed           script               InputEventKey         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           pressed           scancode   S      unicode           echo          script            input/ui_left_mouse_click�              deadzone      ?      events              InputEventMouseButton         resource_local_to_scene           resource_name             device            alt           shift             control           meta          command           button_mask           position              global_position               factor       �?   button_index         pressed           doubleclick           script         !   physics/2d/default_gravity_vector              #   rendering/quality/2d/use_pixel_snap         )   rendering/environment/default_clear_color      ��,>��(>��h>  �?)   rendering/environment/default_environment          res://default_env.tres      GDPC