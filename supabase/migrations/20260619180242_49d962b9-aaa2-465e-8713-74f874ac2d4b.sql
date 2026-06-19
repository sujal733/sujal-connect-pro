CREATE TABLE public.enquiries (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  created_at timestamptz NOT NULL DEFAULT now(),
  enquiry_type text NOT NULL,
  name text NOT NULL,
  phone text NOT NULL,
  email text,
  product_interested text,
  quantity text,
  message text
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.enquiries TO authenticated;
GRANT ALL ON public.enquiries TO service_role;
ALTER TABLE public.enquiries ENABLE ROW LEVEL SECURITY;
CREATE POLICY "Authenticated users can view enquiries"
  ON public.enquiries FOR SELECT TO authenticated USING (true);