
--probability that two randomly selected mating organisms will produce an individual possessing a dominant allele
--f :: Float Float Float -> Float
--f k_XX m_Xx n_xx = ((2/4)*(min m_Xx n_xx) + (1)*(min k_XX n_xx) + (1)*(min m_Xx k_XX) + (3/4)*(m_Xx-1)) + (4/4)*(k_XX-1) + (0/4)*(n_xx-1) -- / (k_XX + m_Xx + n_xx)
f k_XX m_Xx n_xx = (m_Xx/sum) * (n_xx/sum) * (2/4) + (k_XX/sum) * (n_xx/sum) * (4/4) + (m_Xx/sum) * (k_XX/sum) * (4/4) + (m_Xx/sum) * (m_Xx/sum) * (3/4) + (k_XX/sum) * (k_XX/sum) * (4/4) + (n_xx/sum) * (n_xx/sum) * (0/4)
                    where sum = k_XX + m_Xx + n_xx
--m_Xx cross n_xx Xx Xx xx xx 2/4
--k_XX cross n_xx Xx Xx Xx Xx 4/4
--m_Xx cross k_XX XX XX Xx Xx 4/4
--m_Xx cross m_Xx XX Xx Xx xx 3/4
--k_XX cross k_XX XX XX XX XX 4/4
--n_xx cross n_xx xx xx xx xx 0/4

--(m_Xx/sum) * (n_xx/sum) * (2/4) + (k_XX/sum) * (n_xx/sum) * (4/4) + (m_Xx/sum) * (k_XX/sum) * (4/4) + (m_Xx/sum) * (m_Xx/sum) * (3/4) + (k_XX/sum) * (k_XX/sum) * (4/4) + (n_xx/sum) * (n_xx/sum) * (0/4)

--2 2 2
--total: 6 choose 2 = 15
--m_Xx1 cross n_xx1 2/4
--k_XX1 cross n_xx1 4/4
--m_Xx1 cross k_XX1 4/4
--m_Xx1 cross n_xx2 2/4
--k_XX1 cross n_xx2 4/4
--m_Xx1 cross k_XX2 4/4
--m_Xx2 cross n_xx1 2/4
--k_XX2 cross n_xx1 4/4
--m_Xx2 cross k_XX1 4/4
--m_Xx1 cross m_Xx2 3/4
--k_XX1 cross k_XX2 4/4
--m_Xx1 cross m_Xx2 0/4