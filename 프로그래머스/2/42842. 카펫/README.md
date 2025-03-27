# [level 2] 카펫 - 42842 

[문제 링크](https://school.programmers.co.kr/learn/courses/30/lessons/42842) 

### 성능 요약

메모리: 16.4 MB, 시간: 61.24 ms

### 구분

코딩테스트 연습 > 완전탐색

### 채점결과

정확성: 100.0<br/>합계: 100.0 / 100.0

### 제출 일자

2025년 03월 27일 10:51:11

### 문제 설명

<p>Leo는 카펫을 사러 갔다가 아래 그림과 같이 중앙에는 노란색으로 칠해져 있고 테두리 1줄은 갈색으로 칠해져 있는 격자 모양 카펫을 봤습니다.</p>

<p><img src="https://grepp-programmers.s3.ap-northeast-2.amazonaws.com/files/production/b1ebb809-f333-4df2-bc81-02682900dc2d/carpet.png" title="" alt="carpet.png"></p>

<p>Leo는 집으로 돌아와서 아까 본 카펫의 노란색과 갈색으로 색칠된 격자의 개수는 기억했지만, 전체 카펫의 크기는 기억하지 못했습니다.</p>

<p>Leo가 본 카펫에서 갈색 격자의 수 brown, 노란색 격자의 수 yellow가 매개변수로 주어질 때 카펫의 가로, 세로 크기를 순서대로 배열에 담아 return 하도록 solution 함수를 작성해주세요.</p>

### ✏️ 문제 풀이

이 코드는 갈색(brown)과 노란색(yellow) 타일 개수를 이용해 카펫의 가로, 세로 크기를 구하는 함수다.

1. 전체 타일 개수 계산

- sum = brown + yellow 를 계산하여 전체 타일 개수를 구한다.

2. 가능한 가로, 세로 크기 찾기

- sum을 나눌 수 있는 값들을 찾는다.
- for i in 3..<sum 반복문을 통해 sum을 i로 나누었을 때 나머지가 0이면 (i, sum/i) 형태의 가로(row), 세로(col) 조합을 만든다.
- 카펫의 가로(row‌)가 세로(col)보다 크거나 같고(row >= col), 세로가 최소 3 이상(col > 2)이어야 조건을 만족하므로 arr 배열에 저장한다.

3. 노란색 타일의 배치 검증

- arr의 길이가 1보다 크면(즉, 가능한 조합이 여러 개일 경우), yellow를 나눌 수 있는 (i, yellow/i) 형태의 조합을 찾는다.
- (row, col)을 구할 때, yellow 외부에 갈색 테두리가 있으므로 row + 2가 arr에 존재하는지 확인하여 arr2에 저장한다.
- arr2[0]을 선택하여 최종 가로(row = arr2[0] + 2), 세로(col = (yellow / arr2[0]) + 2) 크기를 구하고 result에 추가한다.

4. 가능한 조합이 하나일 경우

- arr에 하나의 값만 존재하는 경우, row = arr[0], col = sum / arr[0]을 설정한다.
- result에 [row, col]을 추가한다.

5. 결과 반환

- result 배열을 반환하여 카펫의 가로와 세로 크기를 출력한다.

<br/>

<h5>제한사항</h5>

<ul>
<li>갈색 격자의 수 brown은 8 이상 5,000 이하인 자연수입니다.</li>
<li>노란색 격자의 수 yellow는 1 이상 2,000,000 이하인 자연수입니다.</li>
<li>카펫의 가로 길이는 세로 길이와 같거나, 세로 길이보다 깁니다.</li>
</ul>

<h5>입출력 예</h5>
<table class="table">
        <thead><tr>
<th>brown</th>
<th>yellow</th>
<th>return</th>
</tr>
</thead>
        <tbody><tr>
<td>10</td>
<td>2</td>
<td>[4, 3]</td>
</tr>
<tr>
<td>8</td>
<td>1</td>
<td>[3, 3]</td>
</tr>
<tr>
<td>24</td>
<td>24</td>
<td>[8, 6]</td>
</tr>
</tbody>
      </table>
<p><a href="http://hsin.hr/coci/archive/2010_2011/contest4_tasks.pdf" target="_blank" rel="noopener">출처</a></p>

<p>※ 공지 - 2020년 2월 3일 테스트케이스가 추가되었습니다.<br>
※ 공지 - 2020년 5월 11일 웹접근성을 고려하여 빨간색을 노란색으로 수정하였습니다.</p>


> 출처: 프로그래머스 코딩 테스트 연습, https://school.programmers.co.kr/learn/challenges
