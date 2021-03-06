close all; clear;
P = [
    245 268;
    333 270;
    400 270;
    459 269;
    521 277;
    581 284;
    627 281;
    668 281;
    706 292;
    693 323;
    649 335;
    624 352;
    619 382;
    596 398;
    556 393;
    517 387;
    470 377;
    436 378;
    418 395;
    390 405;
    366 400;
    324 388;
    276 376;
    254 354;
    244 324;
    222 308;
    193 304;
    165 307;
    140 311;
    115 307;
    97 291;
    87 266;
    87 242;
    87 213;
    99 195;
    126 181;
    152 175;
    175 169;
    196 163;
    220 158;
    247 158;
    261 174;
    272 199;
    306 205;
    338 199;
    378 194;
    413 190;
    445 189;
    461 207;
    453 232;
    431 238;
    409 236;
    384 231;
    366 227;
    349 233;
    329 239;
    306 236;
    277 229;
    247 221;
    205 212;
    169 204;
    141 204;
    124 215;
    115 236;
    129 259;
    159 266;
    204 266;
    245 268;];
plot(P(:,1), P(:,2), 'k--o'); hold on; axis equal;
k = 7;
knots = [zeros(1,k), 0:(1/61):1, ones(1, k)];
t = uniform_param(0, 1, size(P,1));
A = spcol(knots, k, t);
coefs = A\P;
x = spmak(knots, coefs.');
fnplt(x, 'r');
function [t] = uniform_param(a, b, n)
    t = a:(b-a)/(n-1):b;
end